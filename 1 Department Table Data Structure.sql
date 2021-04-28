--1. Create the necessary data structures to contain the data specified in the Appendix ensuring that data integrity is enforced

CREATE TABLE DEPARTMENTS(
    department_id    NUMBER(5) NOT NULL PRIMARY KEY,
    department_name CHAR(50) NOT NULL,
    location CHAR(50) NOT NULL
    )
