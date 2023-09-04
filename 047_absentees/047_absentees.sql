/*
puzzle : 2
ABSENTEES
This problem was presented on the MS ACCESS forum on CompuServe
by Jim Chupella. He wanted to create a database that tracks employee
absentee rates. Here is the table you will use:
CREATE TABLE Absenteeism
(emp_id INTEGER NOT NULL REFERENCES Personnel (emp_id),
 absent_date DATE NOT NULL,
 reason_code CHAR (40) NOT NULL REFERENCES ExcuseList
(reason_code),
 severity_points INTEGER NOT NULL CHECK (severity_points
BETWEEN 1 AND 4),
 PRIMARY KEY (emp_id, absent_date));
An employee ID number identifies each employee. The reason_code
is a short text explanation for the absence (for example, “hit by beer
truck,” “bad hair day,” and so on) that you pull from an ever-growing
and imaginative list, and severity point is a point system that scores the
penalty associated with the absence.
If an employee accrues 40 severity points within a one-year period,
you automatically discharge that employee. If an employee is absent
more than one day in a row, it is charged as a long-term illness, not as a
typical absence. The employee does not receive severity points on the
second, third, or later days, nor do those days count toward his or her
total absenteeism.
Your job is to write SQL to enforce these two business rules, changing
the schema if necessary. */