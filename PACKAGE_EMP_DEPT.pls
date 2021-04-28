create or replace PACKAGE PACKAGE_EMP_DEPT AS 

   
    
    --3 Insert New Employee
    PROCEDURE INSERT_EMPLOYEE(emp_nm in employees.employee_name%TYPE,
         emp_job employees.job_title%TYPE, emp_mng_id employees.manager_id%TYPE, 
         emp_dte_hire employees.date_hired%TYPE, emp_salary employees.salary%TYPE, 
         emp_dept_id employees.department_id%TYPE
         );
         
    --4. Increase salary of an employee
    PROCEDURE increase_salaries (v_salary_per IN OUT employees.salary%TYPE, v_emp_id employees.employee_id%TYPE);
    
    --5. transfer of an Employee to a different Department    
    PROCEDURE change_emp_dept (v_emp_id employees.employee_id%TYPE,v_dept_name departments.department_name%TYPE);
    
    --6. return the Salary for an Employee.
    FUNCTION EMP_SALARY (v_emp_id employees.employee_id%type) RETURN NUMBER;
    
END PACKAGE_EMP_DEPT;