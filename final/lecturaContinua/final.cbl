       IDENTIFICATION DIVISION.
       PROGRAM-ID. lecturacontinua.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
          DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       SELECT choferes 
       ASSIGN TO "Entrada/choferes.txt"
       ORGANIZATION IS LINE SEQUENTIAL
       ACCESS MODE IS SEQUENTIAL
       FILE STATUS IS fs-choferes.

       DATA DIVISION.
       FILE SECTION.
       
       FD choferes LABEL RECORD IS STANDARD.
       01 rec-choferes.
          03 cho-clave.
             05 cho-nombre pic x(7).
             05 cho-fecha-desde pic 9(8).
          05 cho-fecha-hasta pic 9(8).
          05 cho-estado pic x.
          05 cho-numero pic 99.


       WORKING-STORAGE SECTION.

       77 contador pic 999.

       01 fs-choferes pic xx.
          88 ok-cho value "00".
          88 no-cho value "23".
          88 eof-cho value "10".



       PROCEDURE DIVISION.
         PERFORM open-choferes.
         PERFORM process-choferes.
         PERFORM close-choferes.
         stop run.


       open-choferes.
        DISPLAY "open".
        OPEN INPUT choferes.
        IF fs-choferes not equal to "00"
          display "error"
          stop run
        else 
           display "todo ok"  
        end-if.

       close-choferes.
        DISPLAY "close".
        CLOSE choferes.

       process-choferes.
       move 0 to contador.
        perform leer-choferes.
        PERFORM show-choferes UNTIL eof-cho.
        DISPLAY "------process".

       leer-choferes.
        READ choferes RECORD .
        DISPLAY "---------lectura".

       show-choferes.
        ADD cho-numero TO contador.
        DISPLAY "clave " cho-nombre.
        display "contador " contador.
        PERFORM leer-choferes.
