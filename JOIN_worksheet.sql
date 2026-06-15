--SQL JOIN Worksheet

--part 2
----task 1
SELECT firstName, lastName, major, academicLevel
    FROM students
        NATURAL JOIN majors;

----task 2
SELECT firstName, lastName, major, campus, numBuildings
    FROM students
        NATURAL JOIN campuses
        NATURAL JOIN majors;

----task 3
SELECT lastName, major, campus
    FROM students
        NATURAL JOIN campuses 
        NATURAL JOIN majors
    WHERE campus = 'South';

--part 3
----task 1
select firstName, lastName, major, academicLevel
    FROM students
        NATURAL LEFT JOIN majors;

----task 2
SELECT *
    FROM students
        NATURAL LEFT JOIN majors
    WHERE major IS NULL;

--part 4
----task 1


----task 2
SELECT lastName, major, campus, campusPhone