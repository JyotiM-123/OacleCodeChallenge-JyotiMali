--1. Create the necessary data structures to contain the data specified in the Appendix ensuring that data integrity is enforced

CREATE TABLE EMPLOYEES(
    employee_id    NUMBER(10) NOT NULL PRIMARY KEY,
    Employee_name CHAR(50) NOT NULL,
    job_title CHAR(50)NOT NULL,
    manager_id NUMBER(10),
    date_hired DATE DEFAULT SYSDATE NOT NULL,
    salary NUMBER(10) NOT NULL,
    department_id   NUMBER(5) NOT NULL REFERENCES departments(department_id) ON DELETE CASCADE 
    )
