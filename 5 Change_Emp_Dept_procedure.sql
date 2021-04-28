set serveroutput on;

--5. Create an appropriate executable database object to allow the transfer of an Employee to a different Department

DECLARE         
        --Assign variable to transfer of an Employee to a different Department
        v_dept_name departments.department_name%TYPE := 'Engineering'; --Enter department name
        v_emp_id_dept employees.employee_id%TYPE := 90001; --Enter employee ID
BEGIN    
        --Call procedure to transfer of an Employee to a different Department
        dbms_output.put_line('======= 5. allow the transfer of an Employee to a different Department =======');
        dbms_output.put_line('Output: ');
        PACKAGE_EMP_DEPT.change_emp_dept(v_emp_id_dept,v_dept_name );
        dbms_output.put_line('==============================================================================================');    
EXCEPTION
          WHEN EXCEPTIONSPACK.insert_null_into_notnull THEN
             DBMS_OUTPUT.PUT_LINE('Null Not accepted');
           WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('An unexpected error happened. Please try again.');
                DBMS_OUTPUT.PUT_LINE(sqlcode || '-->' || sqlerrm);
END;