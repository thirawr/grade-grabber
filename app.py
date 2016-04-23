from cred import Cred

from flask import Flask, render_template, request, url_for, abort, flash, redirect, current_app
from flaskext.mysql import MySQL
from flask_login import current_user
from flask_user import login_required

from json import dumps 
from string import ascii_lowercase, ascii_uppercase

import user


app = user.create_app()
app.secret_key = 'i_really_love_cookies'
mysql = MySQL()

app.config['MYSQL_DATABASE_USER'] = Cred['MYSQL_DATABASE_USER']
app.config['MYSQL_DATABASE_PASSWORD'] = Cred['MYSQL_DATABASE_PASSWORD']
app.config['MYSQL_DATABASE_DB'] = Cred['MYSQL_DATABASE_DB']
app.config['MYSQL_DATABASE_HOST'] = Cred['MYSQL_DATABASE_HOST']

mysql.init_app(app)
db_connection = mysql.connect()

NUMS = ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9')

def query_grade_aggs(**c_id):
	query = 'SELECT * FROM grade_aggregates;'
	arg = None
	if('c_id' in c_id):
		arg = c_id['c_id']
		print arg
		query =  query[:len(query)-1] + ' WHERE c_id = %s;'
		print query

	with db_connection as cursor:
		if arg == None:
			cursor.execute(query)
		else:
			cursor.execute(query, [arg])
		results = cursor.fetchall()

	return results 

def get_all_s_ids(subject, number):
	query = """SELECT s.s_id FROM semesters AS s 
	INNER JOIN courses AS c ON s.c_id = c.c_id 
	WHERE c.subject = %s AND c.course_number = %s"""
	args = (subject, number)
	with db_connection as cursor:
		cursor.execute(query, args)
		results = cursor.fetchall()
	return results

def get_aggs_from_subj_num(subject, number):
	if subject == "" or number == "":
		return None

	query = """SELECT c_id FROM courses WHERE subject = (%s) AND course_number = (%s)"""
	args = (subject, number)

	with db_connection as cursor:
		cursor.execute(query, args)
		results = cursor.fetchone()
		if results is None:
			return None
		c_id = results[0]
		# query = """SELECT * FROM grade_aggregates WHERE c_id = (%s)"""
		# cursor.execute(query, [c_id])
		# results = cursor.fetchone()
		results = query_grade_aggs(c_id = c_id)

		return results[0]

def get_semesters_from_c_id(c_id):
	query = """SELECT
	s.parsed_term, s.instructor,
	g.average_gpa, g.a_plus_count, g.a_count, g.a_minus_count,
	g.b_plus_count, g.b_count, g.b_minus_count, g.c_plus_count,
	g.c_count, g.c_minus_count, g.d_plus_count, g.d_count, g.d_minus_count,
	g.f_count, g.w_count 
	FROM courses AS c INNER JOIN semesters AS s ON c.c_id = s.c_id
	INNER JOIN grade_counts AS g ON s.s_id = g.s_id
	WHERE s.c_id = (%s) ORDER BY s.raw_term DESC"""

	with db_connection as cursor:
		cursor.execute(query, [c_id])
		results = cursor.fetchall()
	return results


#Deprecated - phase this function out
def query_by_crn_term(crn, term):
	with db_connection as cursor:
		query = 'SELECT * FROM semesters WHERE crn = (%s) AND raw_term = (%s)'
		args = crn, term
		cursor.execute(query, args)
		return cursor.fetchone(),

#Returns all columns except ID for all course records
#Queries by subject and number thanks to handy table constraints
def query_by_subj_num(subj, num):
		query = """SELECT s.crn, s.raw_term, c.subject, c.course_number, c.title,
		g.average_gpa, g.a_plus_count, g.a_count, g.a_minus_count,
		g.b_plus_count, g.b_count, g.b_minus_count,
		g.c_plus_count, g.c_count, g.c_minus_count,
		g.d_plus_count, g.d_count, g.d_minus_count,
		g.f_count, s.instructor, s.section
		FROM courses AS c
		INNER JOIN semesters AS s ON c.c_id = s.c_id
		INNER JOIN grade_counts AS g ON s.s_id = g.s_id
		WHERE c.subject = %s AND c.course_number = %s"""
		with db_connection as cursor:
			#args = subj, str(num)
			cursor.execute(query, [subj, num])
			return cursor.fetchall()

def query_by_s_id(s_id):
	query = """SELECT s.s_id, s.crn, s.raw_term, c.subject, c.course_number, c.title,
		g.average_gpa, g.a_plus_count, g.a_count, g.a_minus_count,
		g.b_plus_count, g.b_count, g.b_minus_count,
		g.c_plus_count, g.c_count, g.c_minus_count,
		g.d_plus_count, g.d_count, g.d_minus_count,
		g.f_count, s.instructor, s.section
		FROM courses AS c
		INNER JOIN semesters AS s ON c.c_id = s.c_id
		INNER JOIN grade_counts AS g ON s.s_id = g.s_id
		WHERE s.s_id = %s"""
	with db_connection as cursor:
		cursor.execute(query, [s_id])
		results = cursor.fetchone()
	return results,


def record_is_duplicate(crn, raw_term, section):
	query = 'SELECT COUNT(*) FROM semesters WHERE crn = (%s) AND raw_term = (%s) AND section = (%s)'
	args = crn, raw_term, section
	with db_connection as cursor:
		cursor.execute(query, args)
		results = cursor.fetchone()
	if results[0] > 0:
		return True
	else:
		return False


#takes SELECT * FROM grade_aggregates output
#returns aggregates counts of letter grades
#grades_viz = [['A+', #], ['A', #]...]
def prep_bar_graph_data(grades_row):
	if grades_row[5] is None:
		#We don't have counts for this class :(
		return None


	grades_viz = [["A+", int(grades_row[5])],
				["A", int(grades_row[6])],
				["A-", int(grades_row[7])],
				["B+", int(grades_row[8])],
				["B", int(grades_row[9])],
				["B-", int(grades_row[10])],
				["C+", int(grades_row[11])],
				["C", int(grades_row[12])],
				["C-", int(grades_row[13])],
				["D+", int(grades_row[14])],
				["D", int(grades_row[15])],
				["D-", int(grades_row[16])],
				["F", int(grades_row[17])],
				["W", int(grades_row[18])]]

	return grades_viz

def prep_line_graph_data(c_id):
	query = """SELECT s.parsed_term, AVG(average_gpa)
	FROM grade_counts AS g INNER JOIN semesters AS s
	ON g.s_id = s.s_id
	WHERE s.c_id = %s  
	GROUP BY s.parsed_term
	ORDER BY s.raw_term ASC"""

	with db_connection as cursor:
		cursor.execute(query, [c_id])
		results = cursor.fetchall()

	if results == ():
		return None

	viz_map_list = []

	for row in results:
		if row[0] != None and row[1] != None:
			viz_map_list.append([str(row[0]), float(row[1])])

	return viz_map_list

def prep_instructor_gpa_data(c_id):
	query = """SELECT s.instructor, AVG(g.average_gpa)
	FROM semesters AS s INNER JOIN grade_counts AS g
	ON s.s_id = g.s_id WHERE s.c_id = %s
	GROUP BY instructor ORDER BY AVG(g.average_gpa) DESC"""

	with db_connection as cursor:
		cursor.execute(query, [c_id])
		results = cursor.fetchall()

	if results == ():
		return None

	viz_map_list = []

	for row in results:
		if row[0] != None and row[1] != None:
			viz_map_list.append([str(row[0]), str(row[1])])

	return viz_map_list

# Should refactor to use results from prep_line_graph_data
def course_summary(c_id):
	query = """SELECT s.parsed_term, AVG(g.average_gpa)
	FROM semesters AS s INNER JOIN grade_counts AS g
	ON s.s_id = g.s_id WHERE s.c_id = %s
	GROUP BY s.parsed_term"""

	with db_connection as cursor:
		cursor.execute(query, [c_id])
		results = cursor.fetchall()

	term_avgs = {'FA': 0.0, 'SP': 0.0, 'SU': 0.0}

	for key in term_avgs:
		term_grades = []
		for row in results:
			if key in row[0] and row[1] != None:
				term_grades.append(float(row[1]))
		
		if len(term_grades) > 0:
			avg = sum(term_grades)/float(len(term_grades))
			term_avgs[key] = avg

	highest_term = []
	highest_key = 'FA'
	for key in term_avgs:
		if term_avgs[key] > term_avgs[highest_key]:
			highest_key = key

	highest_term = [highest_key, term_avgs[highest_key]]

	return [highest_term]



#Record is a dictionary of values:
#[Subject, Course#, Title, CRN, Term, Average GPA, A+, A, A-, B+, B, B-, C+, C, C-, D+, D, D-, F]
def insert_record(record):
	# if record_is_duplicate(record['crn'], record['term'], record['section']):
	# 	flash('Course with identical CRN, term, section already exists in database - try updating the record instead.')
	# 	return None

	#First check if distinct course is in courses table - add if not
	query = 'SELECT COUNT(*) FROM courses WHERE subject = (%s) AND course_number = (%s) AND title = (%s)'
	args = record['subject'], record['number'], record['title']
	with db_connection as cursor:
		cursor.execute(query, args)
		results = cursor.fetchone()
		print results
	#No distinct course yet
	c_id = None
	if results[0] == 0:
		course_insert = 'INSERT INTO courses (subject, course_number, title) VALUES ((%s), (%s), (%s))'
		cursor.execute(course_insert, args)
		# db_connection.commit()
		cursor.execute('SELECT LAST_INSERT_ID() FROM courses')
		c_id = cursor.fetchone()[0]
	else:
		cursor.execute('SELECT c_id FROM courses WHERE subject = (%s) AND course_number = (%s) AND title = (%s)', args)
		c_id = cursor.fetchone()[0]
	c_id = int(c_id)
	#Add course details to semesters
	with db_connection as cursor:
		semDupQuery = 'SELECT COUNT(*) FROM semesters WHERE c_id = %s AND raw_term = %s AND parsed_term = %s AND section = %s AND instructor = %s AND crn = %s AND sched_type = %s'
		args = (c_id, record['term'], record['parsed_term'], record['section'], record['instructor'], record['crn'], record['sched_type'])
		cursor.execute(semDupQuery, args)
		dupeCount = cursor.fetchone()[0]
		if dupeCount > 0:
			flash('Cannot insert duplicate course section. Why not update instead?', 'warning')
			return None



	semester_insert = """INSERT INTO semesters (c_id, raw_term, parsed_term, section, instructor, crn, sched_type) VALUES (%s, %s, %s, %s, %s, %s, %s)"""
	args = c_id, record['term'], record['parsed_term'], record['section'], record['instructor'], record['crn'], record['sched_type']
	cursor.execute(semester_insert, args)
	#Add grade_counts data
	# db_connection.commit()
	cursor.execute('SELECT LAST_INSERT_ID() FROM semesters')
	s_id = int(cursor.fetchone()[0])
	
	if not (record['avg_gpa'] or record['aplus'] or record['a'] or record['aminus'] or record['bplus'] or record['b'] or record['bminus'] or record['cplus'] or record['c'] or record['cminus'] or record['dplus'] or record['d'] or record['dminus'] or record['f']):
		values = (c_id, s_id, None, None, None, None, None, None, None, None, None, None, None, None, None, None, None)
		grade_insert = 'INSERT INTO grade_counts (c_id, s_id, average_gpa, a_plus_count, a_count, a_minus_count, b_plus_count, b_count, b_minus_count, c_plus_count, c_count, c_minus_count, d_plus_count, d_count, d_minus_count, f_count, w_count) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)'
	else:
		values = (c_id, s_id, record['avg_gpa'], record['aplus'], record['a'], record['aminus'], record['bplus'], record['b'], record['bminus'], record['cplus'], record['c'], record['cminus'], record['dplus'], record['d'], record['dminus'], record['f'], record['w'])
		grade_insert = 'INSERT INTO grade_counts VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)'
	# subject = record['subject'].upper()
	# section = record['section'].upper()

	with db_connection as cursor:
		cursor.execute(grade_insert, values)
		db_connection.commit()
		flash('Insertion successful', 'success')
	return 1, c_id

def update_record(form):
	query = "UPDATE grade_counts SET "
	args = []
	if 'update_s_id' not in form:
		flash('Error: no record selected for update operation.', 'error')
		# return render_template('modify.html')
		return

	if not (form['avg_gpa'] or form['aplus'] or form['a'] or form['aminus'] or form['bplus'] or form['b'] or form['bminus'] or form['cplus'] or form['c'] or form['cminus'] or form['dplus'] or form['d'] or form['dminus'] or form['f'] or form['w']):
		flash('Input error: Cannot update a record without first being given values.', 'warning')
		return

	if form['avg_gpa']:
		query += "average_gpa = %s, "
		try:
			args.append(float(form['avg_gpa']))
		except ValueError:
			flash('Invalid input. Average grade must be a decimal or an integer.', 'error')
			return

		# print args
	if form['aplus']:
		query += "a_plus_count = %s, "
		try:
			args.append(int(form['aplus']))
		except ValueError:
			flash('Invalid input. A plus count must be an integer.', 'error')
			return

	if form['a']:
		query += "a_count = %s, "
		try:
			args.append(int(form['a']))
		except ValueError:
			flash('Invalid input. A count must be an integer.', 'error')
			return

	if form['aminus']:
		query += 'a_minus_count = %s, '
		try: 
			args.append(int(form['aminus']))
		except ValueError:
			flash('Invalid input. A minus count must be an integer.', 'error')
			return

	if form['bplus']:
		query += 'b_plus_count = %s, '
		try:
			args.append(int(form['bplus']))
		except ValueError:
			flash('Invalid input. B plus count must be an integer.', 'error')
			return

	if form['b']:
		query += 'b_count = %s, '
		try:
			args.append(int(form['b']))
		except ValueError:
			flash('Invalid input. B count must be an integer.', 'error')
			return

	if form['bminus']:
		query += 'b_minus_count = %s, '
		try:
			args.append(int(form['bminus']))
		except ValueError:
			flash('Invalid input. B minus count must be an integer.', 'error')
			return

	if form['cplus']:
		query += 'c_plus_count = %s, '
		try:
			args.append(int(form['cplus']))
		except ValueError:
			flash('Invalid input. C plus count must be an integer.', 'error')
			return

	if form['c']:
		query += 'c_count = %s, '
		try:
			args.append(int(form['c']))
		except ValueError:
			flash('Invalid input. C count must be an integer.', 'error')
			return

	if form['cminus']:
		query += 'c_minus_count = %s, '
		try:
			args.append(int(form['cminus']))
		except ValueError:
			flash('Invalid input. C minus count must be an integer.', 'error')
			return 

	if form['dplus']:
		query += 'd_plus_count = %s, '
		try:
			args.append(int(form['dplus']))
		except ValueError:
			flash('Invalid input. D plus count must be an integer.', 'error')
			return

	if form['d']:
		query += 'd_count = %s, '
		try:
			args.append(int(form['d']))
		except ValueError:
			flash('Invalid input. D count must be an integer.', 'error')
			return

	if form['dminus']:
		query += 'd_minus_count = %s, '
		try:
			args.append(int(form['dminus']))
		except ValueError:
			flash('Invalid input. D minus count must be an integer.', 'error')
			return

	if form['f']:
		query += 'f_count = %s, '
		try:
			args.append(int(form['f']))
		except ValueError:
			flash('Invalid input. F count must be an integer.', 'error')
			return 

	if form['w']:
		query += 'w_count = %s, '
		try:
			args.append(int(form['w']))
		except ValueError:
			flash('Invalid input. W count must be an integer.', 'error')

	query = query[:len(query)-2] + " " + "WHERE s_id = %s"
	print query

	args.append(int(form['update_s_id']))

	with db_connection as cursor:
		cursor.execute(query, args)

	flash('Update successful.', 'success')
	return

def delete_record(s_id):
	grades_deletion = 'DELETE FROM grade_counts WHERE s_id = %s'
	sems_deletion = 'DELETE FROM semesters WHERE s_id = %s'

	with db_connection as cursor:
		cursor.execute(grades_deletion, [s_id])
		cursor.execute(sems_deletion, [s_id])

	flash('Deletion of record %s successful.' %(s_id), 'success')
	return

# Used for autocomplete
# Returns a list of ["subjNum: title"] for course candidates
def query_candidate_courses(subj, num):
	subj = subj
	num = num
	query = """SELECT DISTINCT c_id, subject, course_number, title FROM courses 
	WHERE subject = %s AND course_number = %s"""
	args = (subj, num)

	with db_connection as cursor:
		cursor.execute(query, args)
		results = cursor.fetchall()
	# print results
	return results 

# Returns True if multiple courses are listed under 
# a subject number pair in courses 
def has_multiple_courses(subj, num):
	with db_connection as cursor:
		query = 'SELECT COUNT(*) FROM courses WHERE subject = %s AND course_number = %s'
		args = (subj, num)
		cursor.execute(query, args)
		count = cursor.fetchone()
		count = count[0]
	if count > 1:
		return True
	else:
		return False 

@app.route("/recommend", methods=['GET'])
def recommend():
    user_manager = current_app.user_manager
    db_adapter = user_manager.db_adapter

    user = user_manager.find_user_by_username(current_user.username)
    print(user.year, user.major, user.gpa)

    year_to_number = {
        'Freshman': (0, 299),
        'Sophomore': (200, 399),
        'Junior': (300, 499),
        'Senior': (499, 499),
        'Masters': (499, 599),
        'PhD': (499, 599)
    }

    course_range = year_to_number[user.year]
    subject = user.major
    gpa = float(user.gpa)

    print(course_range, subject, gpa)

    with db_connection as cursor:
        query = """SELECT c.c_id FROM courses AS c INNER JOIN grade_aggregates AS g ON c.c_id = g.c_id
WHERE g.average_gpa >= %s AND c.course_number >= %s AND c.course_number <= %s AND c.subject = %s ORDER BY RAND() LIMIT 1"""
        args = (gpa, course_range[0], course_range[1], subject)
        cursor.execute(query, args)
        cid = cursor.fetchone()
        if not cid:
            flash('No recommendations available', 'info')
            return redirect(url_for('front'))
        print(cursor.fetchone(), cid)
    return show_selected_course(cid)

@app.route("/", methods=['GET', 'POST'])
def front():
	# print query_grade_aggs()
	if request.method == 'GET':
		return render_template('index.html')
	
	elif request.method == 'POST':
		# print request.form['subj_num']
		query = request.form['subj_num']

		if len(query) < 1:
			flash("We can't read your mind! Enter a course subject and number, like CS411.", 'message')
			return render_template('index.html')

		subj = ""
		num = ""
		print subj, num



		for char in query:
			if char is ' ':
				continue
			elif char in NUMS:
				num += char
			elif char not in ascii_lowercase and char not in ascii_uppercase and char != ' ':
				flash("Invalid input included in search: " + char, "message")
				return render_template('index.html')
			else:
				subj += char

		# print num + " " + subj

		# print results
		# print barData

		multipleCourses = has_multiple_courses(subj, num)
		if multipleCourses:
			# Return all courses on confirmation template
			choices = query_candidate_courses(subj, num)
			# print choices
			return render_template("confirm_course.html", choices=choices)
		else:
			c_id_tuple = query_candidate_courses(subj, num)
			print c_id_tuple
			if not c_id_tuple:
				flash('Course does not exist!', 'error')
				return render_template('index.html')
			else:
				c_id = c_id_tuple[0][0]
				print c_id

			# results = query_grade_aggs(c_id=c_id)
			# results = get_aggs_from_subj_num(subj, num)
			return show_selected_course(c_id)
			
@app.route("/query/<c_id>")
def show_selected_course(c_id):
	print c_id
	results = query_grade_aggs(c_id=c_id)
	print results

	if not results:
		flash('Course does not exist!', 'error')
		return render_template('index.html')
	else:
		results = results[0]
		className = results[1] + str(results[2]) + ": " + results[3]
		tableResults = results[4:]

		if tableResults[0] != None:
			vizData = [prep_bar_graph_data(results), prep_line_graph_data(c_id), prep_instructor_gpa_data(c_id)]
			course_desc = course_summary(c_id)
		else:
			vizData = None
			course_desc = None

		# overall_grades = query_grade_aggs(c_id=results[0])[0]
		# print overall_grades
		semDetails = get_semesters_from_c_id(results[0])

		return render_template('query.html', shortName = (results[1] + str(results[2])), className = className, results=tableResults, semDetails = semDetails, vizData = vizData, overall_grades=results, course_summary = course_desc)


@app.route('/surprise')
def show_random_course():
	with db_connection as cursor:
		cursor.execute('SELECT c_id FROM courses ORDER BY RAND() LIMIT 1')
		c_id = cursor.fetchone()[0]
	return show_selected_course(c_id)

@app.route("/modify", methods=['GET', 'POST'])
@login_required
def modify():
	#status = insert_record(['CS', '411', 'Database Systems', '11111', '120313', '3.5', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 'Tyler Davis', 2112])
	if request.method == 'POST':
		#query = 'SELECT * FROM course '

		# #Searching for a course
		# if 'search' in request.form:
		# 	subject = request.form['subject']
		# 	number = request.form['number']
		# 	results = query_by_subj_num(subject, number)
		# 	return render_template('query.html', results=results)

		#Updating a record
		if 'update_query' in request.form:
			subject = request.form['subject']
			number = request.form['number']
			#print crn
			s_ids = get_all_s_ids(subject, number)
			results = ()
			#with db_connection as cursor:
			for s_id in s_ids:
				row = query_by_s_id(s_id)
				#row = s_id + row
				results += row

			if results:
				return render_template('update.html', s_ids = s_ids, result=results, update=True)
			else:
				flash('No course found matching %s%s' %(subject, number), 'warning')
				return render_template('modify.html')

		elif 'update_conf' in request.form:
			update_record(request.form)

			return render_template('modify.html')

			# print request.form['update_s_id']
			# return 'Success'

		#Inserting a record
		elif 'insert' in request.form:
			#minimal form validation
			if request.form['subject'] and request.form['number'] and request.form['title'] and request.form['crn'] and request.form['term'] and request.form['section'] and request.form['instructor'] and request.form['sched_type']:
				status = insert_record(request.form)
				if status == None:
					return render_template('modify.html')
				else:
					return show_selected_course(status[1])
			else:
				flash('Insertion requires the following fields at minimum: subject, course number, title, CRN and section.')
			return render_template('modify.html')

		elif 'delete' in request.form:
			subject = request.form['subject']
			number = request.form['number']
			s_ids = get_all_s_ids(subject, number)
			results = ()

			for s_id in s_ids:
				row = query_by_s_id(s_id)
				results += row

			return render_template('update.html', s_ids = s_ids, result = results, update = False)

		elif 'delete_conf' in request.form:
			delete_record(request.form['update_s_id'])
			return render_template('modify.html')

	else:
		return render_template('modify.html')

@app.route("/about")
def about():
	return render_template("about.html")

@app.errorhandler(404)
def page_not_found(e):
	return render_template('404.html'), 404

if __name__ == "__main__":
	app.run(debug=True)
