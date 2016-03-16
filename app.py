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
db_connection = mysql.connect()

def query_all():
	#__entry__ handles connection into cursor
	with db_connection as cursor:
		cursor.execute('SELECT * FROM course')
		results = cursor.fetchall()
	return results


def query_by_crn_term(crn, term):
	with db_connection as cursor:
		query = 'SELECT * FROM course WHERE crn = (%s) AND term = (%s)'
		args = crn, term
		cursor.execute(query, args)
		return cursor.fetchone(),


#Record is a dictionary of values:
#[Subject, Course#, Title, CRN, Term, Average GPA, A+, A, A-, B+, B, B-, C+, C, C-, D+, D, D-, F]
def insert_record(record):
	with db_connection as cursor:
		query = 'SELECT COUNT(*) FROM course WHERE crn = (%s) AND term = (%s)'
		args = record['crn'], record['term']
		cursor.execute(query, args)
		results = cursor.fetchall()
		if results[0][0] > 0:
			flash('Course with identical CRN, term already exists in database - try updating the record instead.')
			return None
	insertion = 'INSERT INTO course (subject, course_number, title, crn, term, section, instructor_name, average_gpa, a_plus_count, a_count, a_minus_count, b_plus_count, b_count, b_minus_count, c_plus_count, c_count, c_minus_count, d_plus_count, d_count, d_minus_count, f_count) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)'
	subject = record['subject'].upper()
	section = record['section'].upper()
	if not (record['avg_gpa'] and record['aplus'] and record['a'] and record['aminus'] and record['bplus'] and record['b'] and record['bminus'] and record['cplus'] and record['c'] and record['cminus'] and record['dplus'] and record['d'] and record['dminus'] and record['f']):
		values = (subject, record['number'], record['title'], record['crn'], record['term'], section, record['instructor'], None, None, None, None, None, None, None, None, None, None, None, None, None, None)
	else:
		values = (subject, record['number'], record['title'], record['crn'], record['term'], section, record['instructor'], record['avg_gpa'], record['aplus'], record['a'], record['aminus'], record['bplus'], record['b'], record['bminus'], record['cplus'], record['c'], record['cminus'], record['dplus'], record['d'], record['dminus'], record['f'])
	with db_connection as cursor:
		cursor.execute(insertion, values)
		db_connection.commit()
		flash('Insertion successful')
		return 1


def delete_by_crn_term(crn, term):
	row = query_by_crn_term(crn, term)[0]
	if not row:
		return None
	else:
		with db_connection as cursor:
			deletion = 'DELETE FROM course WHERE crn=%s AND term=%s;'
			args = (crn, term)
			cursor.execute(deletion, args)
			db_connection.commit
			return row
		return None


@app.route("/")
def front():
	return render_template('query.html', results=query_all())


@app.route("/modify", methods=['GET', 'POST'])
def modify():
	#status = insert_record(['CS', '411', 'Database Systems', '11111', '120313', '3.5', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 'Tyler Davis', 2112])
	if request.method == 'POST':
		query = 'SELECT * FROM course '

		#Searching for a course
		if 'search' in request.form:
			subject = request.form['subject']
			number = request.form['number']
			with db_connection as cursor:
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
			with db_connection as cursor:
				query = 'SELECT * FROM course WHERE subject = (%s) AND course_number = (%s) AND crn = (%s);'
				args = subject, number, crn
				cursor.execute(query, args)
				result = cursor.fetchone()
			#Reorder columns
			result = result,
			print result
			result = result[0]
			return render_template('update.html', result=result)

		#Inserting a record
		elif 'insert' in request.form:
			#minimal form validation
			if request.form['subject'] and request.form['number'] and request.form['title'] and request.form['crn'] and request.form['term'] and request.form['section'] and request.form['instructor']:
				status = insert_record(request.form)
				if status == None:
					return render_template('modify.html')
				else:
					return render_template('query.html', results=query_by_crn_term(request.form['crn'], request.form['term']))
			else:
				flash('Insertion requires the following fields at minimum: subject, course number, title, CRN and section.')
			return render_template('modify.html')

		elif 'delete' in request.form:
			row = delete_by_crn_term(request.form['crn'], request.form['term'])
			if row:
				flash(('Successfully deleted:\n (%s)' % str(row)))
			else:
				flash('Grade report does not exist, nothing deleted.')
			return render_template('modify.html')

	else:
		return render_template('modify.html')


if __name__ == "__main__":
	app.run(debug=True)
