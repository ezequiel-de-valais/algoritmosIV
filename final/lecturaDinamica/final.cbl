       IDENTIFICATION DIVISION.
       program-id. Finaltest.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.


       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       *> definir que y como se abren los archivos

       SELECT choferes ASSIGN TO
           "Entrada/indexados/choferes.dat"
           ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS cho-clave
           ALTERNATE RECORD KEY IS cho-nro-legajo WITH DUPLICATES
           FILE STATUS IS fs-choferes.

       DATA DIVISION.
       FILE SECTION.
       *> definir fd de archivos

        FD choferes.
        01 rec-choferes.
           03  cho-clave.
               05  cho-nro-legajo  pic x(7).
               05  cho-fecha-desde.
                   07  cho-fecha-aaaa  pic     9999.
                   07  cho-fecha-mm    pic     99.
                   07  cho-fecha-dd    pic     99.
           03  cho-fecha-hasta     pic 9(8).
           03  cho-turno           pic x.


      working-storage section.
       *> define variables de trabajo

       01 fs-choferes         pic xx.
           88 ok-chof                  value "00".
           88 no-chof                  value "23".
           88 eof-chof                 value "10".

       01 chof-estado               pic xx.
           88 chof-estado-activo        value 'si'.
           88 chof-estado-inactivo      value 'no'.

       01 choaux-nro-legajo  pic x(7).

       01 fecha-auxcho.
            03  fecha-auxcho-aaaa      pic     9999.
            03  fecha-auxcho-mm        pic     99.
            03  fecha-auxcho-dd        pic     99.

       77 op                        pic x.
       77 contador                  pic 99.
       77 EndOfFile                 pic 9.



       PROCEDURE DIVISION.
           *> ejecucion del codigo
           perform open-choferes.
           perform buscar-choferes.
           perform close-choferes.
           stop run.


       open-choferes.
           open input choferes.
           if not ok-chof
               display "Error al abrir archivo choferes fs: "
                 fs-choferes
               accept op
               stop run
           end-if.

       close-choferes.
           close choferes.




       buscar-choferes.
           move "CHOFER3" to cho-nro-legajo.
           move "CHOFER3" to choaux-nro-legajo.
           move "no" to chof-estado.
           move "00000000" to cho-fecha-desde.

           start choferes key is equal to cho-nro-legajo.
           if ok-chof
               perform leer-choferes
               perform procesar-choferes until eof-chof  or
                 cho-nro-legajo <> choaux-nro-legajo 
           end-if.

           display  "*********************".
           move "CHOFER3" to choaux-nro-legajo.
           move "CHOFER3" to cho-nro-legajo.
           move "20180000" to cho-fecha-desde.

           start choferes key is greater than cho-clave.
           if ok-chof
               perform leer-choferes
               perform procesar-choferes until eof-chof  or
                 cho-nro-legajo <> choaux-nro-legajo 
           end-if.

           display  "*********NOEXISTE************".
           move "ASDASD1" to choaux-nro-legajo.
           move "ASDASD1" to cho-nro-legajo.
           move "00000000" to cho-fecha-desde.

           start choferes key is equal to cho-nro-legajo.
           if ok-chof
               perform leer-choferes
               perform procesar-choferes until eof-chof  or
                 cho-nro-legajo <> choaux-nro-legajo 
           end-if.

       leer-choferes.
           read choferes next record.
           move cho-fecha-aaaa to fecha-auxcho-aaaa.
           move cho-fecha-mm to fecha-auxcho-mm.
           move cho-fecha-dd to fecha-auxcho-dd.

       procesar-choferes.
           display  "clave " choaux-nro-legajo.
           display  "clave " cho-nro-legajo.
           display  "clave " cho-clave.
           display  "fecha " cho-fecha-desde.
           display  "--------------------- ".

           perform leer-choferes.
