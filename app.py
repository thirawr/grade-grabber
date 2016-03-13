from flask import Flask, render_template
from flaskext.mysql import MySQL

app = Flask(__name__)
mysql = MySQL()

app.config['MYSQL_DATABASE_USER'] = #YOUR USERNAME
app.config['MYSQL_DATABASE_PASSWORD'] = #YOUR PW
app.config['MYSQL_DATABASE_DB'] = 'grade_grabber'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'

mysql.init_app(app)
dbConnection = mysql.connect()

def search_by_subject_number():
	with dbConnection as cursor:
		cursor.execute('SELECT subject, course_number, title, average_gpa FROM course')
		results = cursor.fetchall()
	output = []
	for row in results:
		rowMap = {}
		for attribute in row:
			if row.index(attribute) == 0:
				rowMap['subject'] = str(attribute)
			elif row.index(attribute) == 1: 
				rowMap['course_number'] = int(attribute)
			elif row.index(attribute) == 2:
				rowMap['title'] = str(attribute)
			else:
				rowMap['average_gpa'] = float(attribute)
		output.append(rowMap)
	return output


@app.route("/")
def hello():
	results = search_by_subject_number()
	return render_template('query.html', results=results)

if __name__ == "__main__":
	app.run(debug=True)