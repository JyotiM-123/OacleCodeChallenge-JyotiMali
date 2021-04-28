set serveroutput on;

--6. Create an appropriate executable database object to return the Salary for an Employee.

DECLARE       
        --Assign variable to return the Salary for an Employee
        V_salary employees.salary%TYPE;
        V_emp_idS employees.employee_id%TYPE := 90005; --Enter Employee ID
BEGIN    
    --Call procedure to return the Salary for an Employee.
    dbms_output.put_line('=========================== 6.return the Salary for an Employee ===========================');
    V_salary := PACKAGE_EMP_DEPT.EMP_SALARY(V_emp_idS);
    
    IF V_salary IS NOT NULL Then 
        dbms_output.put_line('Output: ');
        dbms_output.put_line('Employee Id: ' || V_emp_idS || ' and  salary: ' || V_salary);
    End IF;
    dbms_output.put_line('==============================================================================================');
 
    
EXCEPTION
  WHEN EXCEPTIONSPACK.insert_null_into_notnull THEN
     DBMS_OUTPUT.PUT_LINE('Null Not accepted');
   WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error happened. Please try again.');
        DBMS_OUTPUT.PUT_LINE(sqlcode || '-->' || sqlerrm);
END;