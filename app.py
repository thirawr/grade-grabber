from flask import Flask, render_template
from flaskext.mysql import MySQL

from cred import Cred
app = Flask(__name__)
mysql = MySQL()

app.config['MYSQL_DATABASE_USER'] = Cred['MYSQL_DATABASE_USER']
app.config['MYSQL_DATABASE_PASSWORD'] = Cred['MYSQL_DATABASE_PASSWORD']
app.config['MYSQL_DATABASE_DB'] = Cred['MYSQL_DATABASE_DB']
app.config['MYSQL_DATABASE_HOST'] = Cred['MYSQL_DATABASE_HOST']

mysql.init_app(app)
dbConnection = mysql.connect()

def query_all():
	with dbConnection as cursor:
		cursor.execute('SELECT subject, course_number, title, average_gpa, crn, term FROM course')
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
			elif row.index(attribute) == 3:
				rowMap['average_gpa'] = float(attribute)
			elif row.index(attribute) == 4:
				rowMap['crn'] = attribute
			else:
				rowMap['term'] = attribute
		output.append(rowMap)
	return output

#Record is a list of values:
#[Subject, Course#, Title, CRN, Term, Average GPA, A+, A, A-, B+, B, B-, C+, C, C-, D+, D, D-, F]
def insert_record(record):
	subject = record[0]
	course_number = record[1]
	title = record[2]
	CRN = record[3]
	term = record[4]
	avg_gpa = record[5]
	a_plus_count = record[6]
	a_count = record[7]
	a_minus_count = record[8]
	b_plus_count = record[9]
	b_count = record[10]
	b_minus_count = record[11]
	c_plus_count = record[12]
	c_count = record[13]
	c_minus_count = record[14]
	d_plus_count = record[15]
	d_count = record[16]
	d_minus_count = record[17]
	f_count = record[18]
	instructor_name = record[19]
	section = record[20]

	with dbConnection as cursor:
		query = 'SELECT COUNT(*) FROM course WHERE crn = (%s) AND term = (%s)'
		args = int(CRN), int(term)
		cursor.execute(query, args)
		results = cursor.fetchall()
		print results
			#error = 'Course with identical CRN, Term already exists in our records.'
			#return error
		#else:
		insertion = 'INSERT INTO course (crn, term, subject, course_number, title, average_gpa, a_plus_count, a_count, a_minus_count, b_plus_count, b_count, b_minus_count, c_plus_count, c_count, c_minus_count, d_plus_count, d_count, d_minus_count, f_count, instructor_name, section) VALUES ((%s), (%s), (%s), (%s), (%s), (%s), (%s), (%s), (%s), (%s), (%s), (%s), (%s), (%s), (%s), (%s), (%s), (%s), (%s), (%s), (%s));'
		args = CRN, term, subject, course_number, title, avg_gpa, a_plus_count, a_count, a_minus_count, b_plus_count, b_count, b_minus_count, c_plus_count, c_count, c_minus_count, d_plus_count, d_count, d_minus_count, f_count, instructor_name, section 
		cursor.execute(insertion, args)
		return 'Success'


@app.route("/")
def front():
	results = query_all()
	return render_template('query.html', results=results)

@app.route("/modify")
def modify():
	#status = insert_record(['CS', '411', 'Database Systems', '11111', '120313', '3.5', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 'Tyler Davis', 2112])
	return render_template('modify.html', status=status)

@app.route('/update')
def update():
	return render_template('update.html')

if __name__ == "__main__":
	app.run(debug=True)
