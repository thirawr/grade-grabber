from cred import Cred

from flask import Flask, render_template
from flask_mail import Mail
from flask_sqlalchemy import SQLAlchemy
from flask_user import login_required, UserManager, UserMixin, SQLAlchemyAdapter

import os


# Use a Class-based config to avoid needing a 2nd file
# os.getenv() enables configuration through OS environment variables
class ConfigClass(object):
    # Flask settings
    SECRET_KEY =              os.getenv('SECRET_KEY',       Cred['SECRET_KEY'])
    SQLALCHEMY_DATABASE_URI = os.getenv('DATABASE_URL',     Cred['DATABASE_URL'])
    CSRF_ENABLED = True

    # Flask-Mail settings
    MAIL_USERNAME =           os.getenv('MAIL_USERNAME',        Cred['MAIL_USERNAME'])
    MAIL_PASSWORD =           os.getenv('MAIL_PASSWORD',        Cred['MAIL_PASSWORD'])
    MAIL_DEFAULT_SENDER =     os.getenv('MAIL_DEFAULT_SENDER',  Cred['MAIL_DEFAULT_SENDER'])
    MAIL_SERVER =             os.getenv('MAIL_SERVER',          Cred['MAIL_SERVER'])
    MAIL_PORT =           int(os.getenv('MAIL_PORT',            Cred['MAIL_PORT']))
    MAIL_USE_SSL =        int(os.getenv('MAIL_USE_SSL',         Cred['MAIL_USE_SSL']))

    # Flask-User settings
    USER_APP_NAME        = "Grade Grabber"                # Used by email templates


def create_app():
    """ Flask application factory """
    
    # Setup Flask app and app.config
    app = Flask(__name__)
    app.config.from_object(__name__+'.ConfigClass')

    # Initialize Flask extensions
    db = SQLAlchemy(app)                            # Initialize Flask-SQLAlchemy
    mail = Mail(app)                                # Initialize Flask-Mail

    # Define the User data model. Make sure to add flask.ext.user UserMixin !!!
    class User(db.Model, UserMixin):
        id = db.Column(db.Integer, primary_key=True)

        # User authentication information
        username = db.Column(db.String(50), nullable=False, unique=True)
        password = db.Column(db.String(255), nullable=False, server_default='')
        reset_password_token = db.Column(db.String(100), nullable=False, server_default='')

        # User email information
        email = db.Column(db.String(255), nullable=False, unique=True)
        confirmed_at = db.Column(db.DateTime())

        # User information
        active = db.Column('is_active', db.Boolean(), nullable=False, server_default='0')
        first_name = db.Column(db.String(100), nullable=False, server_default='')
        last_name = db.Column(db.String(100), nullable=False, server_default='')

        year = db.Column(db.Enum('Freshman', 'Sophomore', 'Junior', 'Senior', 'Masters', 'PhD'), nullable=True, server_default=None)
        major = db.Column(db.String(100), nullable=True, server_default=None)
        gpa = db.Column(db.Float(precision=2))

    # Create all database tables
    db.create_all()

    # Setup Flask-User
    db_adapter = SQLAlchemyAdapter(db, User)        # Register the User model
    user_manager = UserManager(db_adapter, app)     # Initialize Flask-User
    return app
