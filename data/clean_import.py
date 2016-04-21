from csv import reader
from sys import argv
from random import randrange
import MySQLdb

class Course:
	def __init__(self, crn, subject, number, title, section, sched_type, term, parsed_term, instructor, a_plus, a, a_minus, b_plus, b, b_minus, c_plus, c, c_minus, d_plus, d, d_minus, f, w, average_grade):
		self.crn = crn
		self.subject = subject.strip()
		self.number = number.strip()
		self.title = title.strip()
		self.section = section
		self.sched_type = sched_type
		self.term = term
		self.parsed_term = parsed_term
		self.instructor = instructor
		self.a_plus = a_plus
		self.a = a
		self.a_minus = a_minus
		self.b_plus = b_plus
		self.b = b
		self.b_minus = b_minus
		self.c_plus = c_plus
		self.c = c
		self.c_minus = c_minus
		self.d_plus = d_plus
		self.d = d
		self.d_minus = d_minus
		self.f = f
		self.w = w
		self.average_grade = average_grade


class Grade_Reports:
	def __init__(self, distinct_courses, course_info, course_grades):
		self.distinct_courses = distinct_courses
		self.course_info = course_info
		self.course_grades = course_grades


def prepare_data(RAWPATH):
	all_courses = []
	with open(RAWPATH, 'r+') as csvIn:
		csvReader = reader(csvIn)
		for row in csvReader:
			print row[7]
			sched_type = None
			if row[5] == '':
				sched_type = 'X'
			else:
				sched_type = row[5]
			course_info = Course(row[0], row[1], row[2], row[3], row[4], sched_type, row[6], row[7], row[8], row[9], row[10], row[11], row[12], row[13], row[14], row[15], row[16], row[17], row[18], row[19], row[20], row[21], row[22], row[23])
			all_courses.append(course_info)
			# count += 1
	
	return all_courses

def insert_records(all_courses):
	distinct_courses = []

	db = MySQLdb.connect(passwd='direct12', db='grade_grabber')
	cursor = db.cursor()

	# print "SEMESTER: %s" %(all_courses[0][7])
	print "Verifying whether courses are duplicates..."

	for record in all_courses:
		#First verify that we don't already have course in DB
		course_check = """SELECT COUNT(*) FROM courses 
		WHERE subject = %s AND course_number = %s AND title = %s"""
		args = (record.subject, record.number, record.title)

		cursor.execute(course_check, args)

		courseCount = cursor.fetchone()
		if courseCount[0] == 0 and (record.subject, int(record.number), record.title) not in distinct_courses:
			distinct_courses.append((record.subject, int(record.number), record.title))


	courses_query = """INSERT INTO courses (subject, course_number, title)
	VALUES (%s, %s, %s)"""
	courses_to_insert = []
	for course in distinct_courses:
		row = (course[0], course[1], course[2])
		# print row
		courses_to_insert.append(row)

	print "Inserting new courses..."
	cursor.executemany(courses_query, courses_to_insert)
	# db.commit()
	print "Courses inserted."


	semester_query = """INSERT INTO semesters (c_id, raw_term, parsed_term, section, instructor, crn, sched_type)
	VALUES (%s, %s, %s, %s, %s, %s, %s)"""

	semesters_to_insert = []

	for course in all_courses:
		cursor.execute('SELECT c_id FROM courses WHERE subject = %s AND course_number = %s AND title = %s', [course.subject, course.number, course.title])
		c_id = cursor.fetchone()
		c_id = c_id[0]
		row = (c_id, course.term, course.parsed_term, course.section, course.instructor, course.crn, course.sched_type)
		semesters_to_insert.append(row)

	# print semesters_to_insert

	print "Inserting semesters..."

	cursor.executemany(semester_query, semesters_to_insert)

	print "Done."

	grades_query = """INSERT INTO grade_counts(s_id, c_id, average_gpa,
	a_plus_count, a_count, a_minus_count, b_plus_count, b_count,
	b_minus_count, c_plus_count, c_count, c_minus_count, d_plus_count,
	d_count, d_minus_count, f_count, w_count) VALUES (%s, %s, %s, %s, %s,
	%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"""

	all_grades = []
	for record in all_courses:
		cursor.execute('SELECT s_id, c_id FROM semesters WHERE crn = %s AND raw_term = %s AND section = %s AND instructor = %s AND sched_type = %s', [record.crn, record.term, record.section, record.instructor, record.sched_type])
		results = cursor.fetchone()
		s_id = results[0]
		c_id = results[1]

		print record.crn + " " + record.title
		print str(c_id) + "-" + str(s_id)

		if record.average_grade.upper() == 'N/A':
			record.a_plus = None
			record.a = None
			record.a_minus = None
			record.b_plus = None
			record.b = None
			record.b_minus = None
			record.c_plus = None
			record.c = None
			record.c_minus = None
			record.d_plus = None
			record.d = None
			record.d_minus = None
			record.f = None
			record.w = None
			record.average_grade = None

		all_grades.append([s_id, c_id, record.average_grade, record.a_plus, 
		record.a, record.a_minus, record.b_plus, record.b, record.b_minus,
		record.c_plus, record.c, record.c_minus, record.d_plus,
		record.d, record.d_minus, record.f, record.w])

	cursor.executemany(grades_query, all_grades)
	db.commit()


def main(argv):
	if len(argv) < 2:
		print 'Usage: python clean_import.py filepath'
		exit()
	RAWPATH = argv[1]
	# parsed_term = argv[2]
	all_courses = prepare_data(RAWPATH)
	# print distinct_courses
	insert_records(all_courses)


if __name__ == '__main__':
	main(argv)