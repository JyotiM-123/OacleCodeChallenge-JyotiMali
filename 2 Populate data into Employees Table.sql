-- 2. Populate the Departments and Employees data structures using the data specified in the Appendix

INSERT INTO EMPLOYEES(EMPLOYEE_ID,EMPLOYEE_NAME,JOB_TITLE,DATE_HIRED,SALARY,DEPARTMENT_ID) VALUES (90001,'John Smith','CEO',to_date('01/01/95','dd-mm-yyyy'),100000,1);

INSERT INTO EMPLOYEES VALUES (90002,'Jimmy Willis','Manager',90001,to_date('23/09/03','dd-mm-yyyy'),52500,4);

INSERT INTO EMPLOYEES(EMPLOYEE_ID,EMPLOYEE_NAME,JOB_TITLE,DATE_HIRED,SALARY,DEPARTMENT_ID) VALUES (90003,'Roxy Jones','Salesperson',to_date('11/02/17','dd-mm-yyyy'),35000,4);

INSERT INTO EMPLOYEES(EMPLOYEE_ID,EMPLOYEE_NAME,JOB_TITLE,DATE_HIRED,SALARY,DEPARTMENT_ID) VALUES (90004,'Selwyn Field','Salesperson',to_date('20/05/15','dd-mm-yyyy'),32000,4);

INSERT INTO EMPLOYEES VALUES (90005,'David Hallett','Engineer',90006,to_date('17/04/18','dd-mm-yyyy'),40000,2);

INSERT INTO EMPLOYEES VALUES (90006,'Sarah Phelps','Manager',90001,to_date('21/03/15','dd-mm-yyyy'),45000,2);

INSERT INTO EMPLOYEES VALUES (90007,'Louise Harper','Engineer',90006,to_date('01/01/13','dd-mm-yyyy'),47000,2);

INSERT INTO EMPLOYEES VALUES (90008,'Tina Hart','Engineer',90009,to_date('28/07/14','dd-mm-yyyy'),45000,3);

INSERT INTO EMPLOYEES VALUES (90009,'Gus Jones','Manager',90001,to_date('15/05/18','dd-mm-yyyy'),50000,3);

INSERT INTO EMPLOYEES VALUES (90010,'Mildred Hall','Secretary',90001,to_date('12/10/96','dd-mm-yyyy'),35000,1);

SELECT * FROM EMPLOYEES;
