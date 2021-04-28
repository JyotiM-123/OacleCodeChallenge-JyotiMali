create or replace PACKAGE BODY PACKAGE_EMP_DEPT AS

   --3 Insert New Employee
  PROCEDURE INSERT_EMPLOYEE(emp_nm in employees.employee_name%type,
         emp_job employees.job_title%type, emp_mng_id employees.manager_id%type, 
         emp_dte_hire employees.date_hired%type, emp_salary employees.salary%type, 
         emp_dept_id employees.department_id%type
         ) AS 
         
             CURSOR c_emps IS SELECT * FROM (SELECT * FROM employees ORDER BY employee_id DESC)WHERE ROWNUM = 1; --Fetch last record from employee table to access employee_id's value
             last_id employees.employee_id%TYPE;  
  BEGIN
            FOR emp IN c_emps LOOP
                 last_id := emp.employee_id+1 ; --Generate new employee_id 
                 INSERT INTO EMPLOYEES(employee_id,employee_name,job_title,manager_id,date_hired,salary,department_id) VALUES 
                 (last_id,emp_nm,emp_job,emp_mng_id,emp_dte_hire,emp_salary,emp_dept_id); --insert new record into employee table
            END LOOP;
        NULL;
    END INSERT_EMPLOYEE;
    
    --4. Increase salary of an employee
    PROCEDURE increase_salaries (v_salary_per IN OUT employees.salary%TYPE, v_emp_id employees.employee_id%TYPE) As
        CURSOR c_emps is SELECT *FROM employees WHERE employee_id=V_emp_id  FOR UPDATE;
        v_old_salary NUMBER; --stored old salary to display in output
        cursor_is_empty BOOLEAN;
    BEGIN
        cursor_is_empty :=TRUE;
        FOR r_emp IN c_emps LOOP
          cursor_is_empty := FALSE; 
          v_old_salary := r_emp.salary;
          r_emp.salary := r_emp.salary + ((r_emp.salary * v_salary_per)/100); --calculate increment by percentage and added in the salary
          UPDATE employees SET ROW = r_emp WHERE CURRENT OF c_emps; --Update th salary
          dbms_output.put_line('The salary of : '|| r_emp.employee_id 
                                || ' is increased from '||v_old_salary||' to '||r_emp.salary); --print salary  after adding increments
        END LOOP;
        --dbms_output.put_line('Procedure finished executing!');
        IF cursor_is_empty  THEN    
            raise EXCEPTIONSPACK.cursor_returned_no_rows;  
        END IF;
    
  EXCEPTION
        WHEN EXCEPTIONSPACK.cursor_returned_no_rows  THEN    
            dbms_output.put_line ('There is no emplyee with ID' || v_emp_id);
  END;
  
  
  --5. transfer of an Employee to a different Department 
  PROCEDURE change_emp_dept (v_emp_id employees.employee_id%TYPE,v_dept_name departments.department_name%TYPE) As
        CURSOR c_emps IS SELECT * FROM employees WHERE employees.employee_id=v_emp_id  FOR UPDATE; --cursor to fetch a record of an employee to change department_id
        CURSOR c_depts IS SELECT * FROM departments WHERE departments.department_name= v_dept_name;  --cursor to access department_id bassed on department name
        cursoremp_is_empty BOOLEAN;
        cursordept_is_empty BOOLEAN;
  BEGIN
        cursoremp_is_empty:=TRUE;
        cursordept_is_empty:=TRUE;
        FOR emp IN c_emps LOOP
            cursoremp_is_empty:=FALSE;       
             FOR dept IN c_depts LOOP
                   cursordept_is_empty:=FALSE;
                  emp.department_id := dept.department_id ;
                  UPDATE employees SET ROW = emp WHERE CURRENT OF c_emps; --Update department id for an employee 
                  dbms_output.put_line('Employee id : '|| emp.employee_id || ' has now been changed to '|| v_dept_name); --Print modified data
                  --|| ' has nowbeen chaged to '|| v_dept_name);
            END LOOP;
        END LOOP;
        IF cursoremp_is_empty OR cursordept_is_empty THEN    
            raise EXCEPTIONSPACK.cursor_returned_no_rows;   
        END IF;
    
    EXCEPTION
          WHEN EXCEPTIONSPACK.cursor_returned_no_rows  THEN    
            dbms_output.put_line ('There is no emplyee with ID ' || v_emp_id || 'or No department as ' || v_dept_name);
    END;
    
    
    --6. return the Salary for an Employee.
    FUNCTION EMP_SALARY(v_emp_id employees.employee_id%TYPE) RETURN NUMBER AS 
        V_emp_sal employees.salary%TYPE;
    BEGIN
        SELECT salary INTO V_emp_sal FROM employees WHERE employee_id=v_emp_id; 
        IF V_emp_sal =NULL THEN
            V_emp_sal:= 0;    
        END IF;
        RETURN V_emp_sal;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
              DBMS_OUTPUT.PUT_LINE ('Employee ID: ' || v_emp_id || ' is not avilable'); 
              return NULL;
    END EMP_SALARY;
    
    
END PACKAGE_EMP_DEPT;