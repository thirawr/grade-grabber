from flask import Flask 
from flaskext.mysql import MySQL

mysql = MySQL()
app = Flask(__name__)

app.config['MYSQL_DATABASE_USER'] = #YOUR MYSQL USERNAME
app.config['MYSQL_DATABASE_PASSWORD'] = #YOUR MYSQL PASSWORD
app.config['MYSQL_DATABASE_DB'] = 'grade_grabber'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
mysql.init_app(app)

@app.route("/")
def hello():
	cursor = mysql.connect().cursor()
	cursor.execute('SELECT title FROM course')
	data = cursor.fetchone()
	if data is None:
		return 'No data'
	else:
		return data

if __name__ == "__main__":
	app.run(debug=True)