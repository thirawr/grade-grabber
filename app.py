from flask import Flask, render_template, request, url_for, abort, flash
from flaskext.mysql import MySQL

from cred import Cred
app = Flask(__name__)
app.secret_key = 'i_really_love_cookies'
mysql = MySQL()

app.config['MYSQL_DATABASE_USER'] = Cred['MYSQL_DATABASE_USER']
app.config['MYSQL_DATABASE_PASSWORD'] = Cred['MYSQL_DATABASE_PASSWORD']
app.config['MYSQL_DATABASE_DB'] = Cred['MYSQL_DATABASE_DB']
app.config['MYSQL_DATABASE_HOST'] = Cred['MYSQL_DATABASE_HOST']

mysql.init_app(app)
dbConnection = mysql.connect()

# class GradeReport:
# 	"""
# 	Class to represent one course to preserve insertion integrity
# 	Also eases my tired fingers
# 	"""
# 	def __init__(self, subject, course_number, title, crn, term, instructor, average_gpa, a_plus, a, a_minus, b_plus, b, b_minus, c_plus, c, c_minus, d_plus, d, d_minus, f):
# 		self.subject = subject
# 		self.course_number = course_number
# 		self.title = title
# 		self.crn = crn 
# 		self.term = term
# 		self.instructor = instructor
# 		self.average_gpa = average_gpa
# 		self.a_plus = a_plus
# 		self.a = a
# 		self.a_minus = a_minus
# 		self.b_plus = b_plus
# 		self.b = b
# 		self.b_minus = b_minus
# 		self.c_plus = c_plus
# 		self.c = c
# 		self.c_minus = c_minus
# 		self.d_plus = d_plus
# 		self.d = d
# 		self.d_minus = d_minus
# 		self.f = f

def query_all():
	with dbConnection as cursor:
		cursor.execute('SELECT * FROM course')
		results = cursor.fetchall()
	return results

def query_by_crn_term(crn, term):
	with dbConnection as cursor:
		query = 'SELECT * FROM course WHERE crn = (%s) AND term = (%s)'
		args = crn, term
		cursor.execute(query, args)
		return cursor.fetchone(),

#Record is a dictionary of values:
#[Subject, Course#, Title, CRN, Term, Average GPA, A+, A, A-, B+, B, B-, C+, C, C-, D+, D, D-, F]
def insert_record(record):
	#@Todo: implement N/A case for letter grades?
	#assumes all fields are filled
	with dbConnection as cursor:
		query = 'SELECT COUNT(*) FROM course WHERE crn = (%s) AND term = (%s)'
		args = str(record['crn']), str(record['term'])
		cursor.execute(query, args)
		results = cursor.fetchall() 
		if results[0][0] > 0:
			flash('Course with identical CRN, term already exists in database - try updating the record instead')
			return None
	insertion = 'INSERT INTO course (subject, course_number, title, crn, term, section, instructor_name, average_gpa, a_plus_count, a_count, a_minus_count, b_plus_count, b_count, b_minus_count, c_plus_count, c_count, c_minus_count, d_plus_count, d_count, d_minus_count, f_count) VALUES '
	values = "('" + record['subject'] + "', '" + record['number'] + "', '" + record['title'] + "', '" + record['crn'] + "', '" + record['term'] + "', '" + record['section'] + "', '" + record['instructor'] + "', " + record['avg_gpa'] + ', ' + record['aplus'] + ', ' + record['a'] + ', ' + record['aminus'] + ', ' + record['bplus'] + ', ' + record['b'] + ', ' + record['bminus'] + ', ' + record['cplus'] + ', ' + record['c'] + ', ' + record['cminus'] + ', ' + record['dplus'] + ', ' + record['d'] + ', ' + record['dminus'] + ', ' + record['f'] + ');'
	insertion = insertion + values
	with dbConnection as cursor:
		cursor.execute(insertion)
		dbConnection.commit()
		flash('Insertion successful')
		return 1

@app.route("/")
def front():
	results = query_all()
	return render_template('query.html', results=results)

@app.route("/modify", methods=['GET', 'POST'])
def modify():
	#status = insert_record(['CS', '411', 'Database Systems', '11111', '120313', '3.5', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 'Tyler Davis', 2112])
	if request.method == 'POST':
		query = 'SELECT * FROM course '
		
		#Searching for a course
		if 'search' in request.form:
			subject = request.form['subject']
			number = request.form['number']
			with dbConnection as cursor:
				query = query + 'WHERE subject = (%s) AND course_number = (%s);'
				args = str(subject), str(number)
				cursor.execute(query, args)
				results = cursor.fetchall()
			return render_template('query.html', results=results)
		
		#Updating a record
		elif 'update' in request.form:
			subject = request.form['subject']
			number = request.form['number']
			crn = request.form['crn']
			#print crn
			with dbConnection as cursor:
				query = 'SELECT * FROM course WHERE subject = (%s) AND course_number = (%s) AND crn = (%s);'
				args = subject, number, crn
				cursor.execute(query, args)
				result = cursor.fetchone()
			#Exclude W, Instructor, Section
			result = result,
			print result
			result = result[1:4]+result[len(result)-1]+result[4:]
			return render_template('update.html', result=result)

		#Inserting a record
		elif 'insert' in request.form:
			#minimal form validation
			if request.form['subject'] and request.form['number'] and request.form['title'] and request.form['crn'] and request.form['term'] and request.form['section']:
				status = insert_record(request.form)
				if status == None:
					return render_template('modify.html')
				else:
					return render_template('query.html', results=query_by_crn_term(request.form['crn'], request.form['term']))
			else:
				flash('Insertion requires the following fields at minimum: subject, course number, title, CRN and section.')
			return render_template('modify.html')

		#@todo: Deleting a record
		elif 'delete' in request.form:
			pass
	else:
		return render_template('modify.html')

if __name__ == "__main__":
	app.run(debug=True)
