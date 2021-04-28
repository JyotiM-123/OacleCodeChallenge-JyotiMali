set serveroutput on;

--4. Create an appropriate executable database object to allow the Salary for an Employee to be increased or decreased by a percentage

DECLARE       
        --Assign variable to increase the salary for an employee
         V_sal_per employees.salary%TYPE := -1; --Place -ve value for decrement and +ve value for increment
         
         V_emp_id_salary employees.employee_id%TYPE:= 90003; --Enter Employee ID
BEGIN
    --Call procedure to increase the salary for an employee
    dbms_output.put_line('======= 4. allow the Salary for an Employee to be increased or decreased by a percentage =======');
    dbms_output.put_line('Output: ');
    PACKAGE_EMP_DEPT.increase_salaries(V_sal_per,V_emp_id_salary );
    dbms_output.put_line('==============================================================================================');
EXCEPTION
  WHEN EXCEPTIONSPACK.insert_null_into_notnull THEN
     DBMS_OUTPUT.PUT_LINE('Null Not accepted');
   WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error happened. Please try again.');
        DBMS_OUTPUT.PUT_LINE(sqlcode || '-->' || sqlerrm);
END;