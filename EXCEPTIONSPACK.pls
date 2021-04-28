create or replace PACKAGE EXCEPTIONSPACK AS 

  /* TODO enter package declarations (types, exceptions, methods etc) here */ 
    insert_null_into_notnull EXCEPTION;
  PRAGMA EXCEPTION_INIT(insert_null_into_notnull, -1407);

   cursor_returned_no_rows EXCEPTION;
   PRAGMA EXCEPTION_INIT(cursor_returned_no_rows, -1000);
   
END EXCEPTIONSPACK;