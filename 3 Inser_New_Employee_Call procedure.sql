set serveroutput on;

  --3. Create an appropriate executable database object to allow an Employee to be created
  
DECLARE
        --Assign variable to insert new employee
        V_emp_nm employees.employee_name%TYPE := 'Dale Smith' ;
        V_emp_job employees.job_title%TYPE := 'Secretary';
        V_emp_mng_id employees.manager_id%TYPE := Null; 
        V_emp_dte_hire employees.date_hired%TYPE := to_date('5/4/2021','dd-mm-yyyy'); 
        V_emp_salary employees.salary%TYPE := 30000;
        V_emp_dept_id employees.department_id%TYPE := 3;
        
BEGIN
    --Call procedure to insert new employee
    dbms_output.put_line('============================ 3. allow an Employee to be created ============================');
    dbms_output.put_line('Output: ');
    PACKAGE_EMP_DEPT.INSERT_EMPLOYEE(V_emp_nm,V_emp_job,V_emp_mng_id,V_emp_dte_hire,V_emp_salary,V_emp_dept_id );
    DBMS_OUTPUT.PUT_LINE('Data inserted successfully');
    dbms_output.put_line('=============================================================================================='); 
    
EXCEPTION
  WHEN EXCEPTIONSPACK.insert_null_into_notnull THEN
     DBMS_OUTPUT.PUT_LINE('Null Not accepted');
   WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error happened. Please try again.');
        DBMS_OUTPUT.PUT_LINE(sqlcode || '-->' || sqlerrm);
END;