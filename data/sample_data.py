import csv
from sys import argv

RAWFILE = "grade_reports_fall_2014.csv"

class Grade_Report:
	def __init__(self, crn, subject, number, title, section, term, instructor, a_plus, a, a_minus, b_plus, b, b_minus, c_plus, c, c_minus, d_plus, d, d_minus, f, average_gpa):
		self.crn = crn
		self.subject = subject
		self.number = number
		self.title = title
		self.section = section
		self.term = term
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
		self.d_minus = d
		self.f = f
		self.average_gpa = average_gpa

def prepare_data(rawfile):
	# crn, subject, number, title, section, term, instructor, a_plus, a, a_minus,
	# b_plus, b, b_minus, c_plus, c, c_minus, d_plus, d, d_minus, f, average_gpa
	courses = []
	sampleCourses = 49
	with open(rawfile, 'r+') as csvIn:
		reader = csv.reader(csvIn)
		for row in reader:
			if row[8] == 'N/A' or row[0] == 'CRN':
				continue
			course = Grade_Report(row[0], row[1], row[2], row[3], row[4], row[6], row[7], row[8], row[9], row[10], row[11], row[12], row[13], row[14], row[15], row[16], row[17], row[18], row[19], row[20], row[22])
			courses.append(course)
			if sampleCourses < 1:
				break
			else:
				sampleCourses = sampleCourses - 1
	
	return courses

def write_records(records):
	rows = []
	for record in records:
		row = [record.crn, record.term, record.subject, record.number, record.title, record.average_gpa, record.a_plus, record.a, record.a_minus, record.b_plus, record.b, record.b_minus, record.c_plus, record.c, record.c_minus, record.d_plus, record.d, record.d_minus, record.f, record.instructor, record.section]
		rows.append(row)
	with open('sample.csv', 'w+') as csvOut:
		writer = csv.writer(csvOut)
		writer.writerows(rows)



def __main__(argv):
	course_data = prepare_data(RAWFILE)
	write_records(course_data)

if __name__ == '__main__':
	__main__(argv)