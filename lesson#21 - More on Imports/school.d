module school;

// public access to the contents of student module
public import student;

struct School {
	Student student;

	this(Student s) {
		student = s;
	}
}