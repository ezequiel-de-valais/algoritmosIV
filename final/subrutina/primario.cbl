        IDENTIFICATION DIVISION.
        PROGRAM-ID. primario.

        ENVIRONMENT DIVISION.
        CONFIGURATION SECTION.
        SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

        INPUT-OUTPUT SECTION.

        FILE-CONTROL.

        DATA DIVISION.
        FILE SECTION.
        
        WORKING-STORAGE SECTION.

        01 op   pic x.
        01 cli-clave   pic 9(8).
        01 cli-numero          pic x(8).
        01 cli-direccion       pic x(30).


       PROCEDURE DIVISION.
           perform abrir-clientes.
           perform mostrar-section.
           perform cerrar-clientes.
           accept op.
           stop run.

       abrir-clientes.
           move "A" to op.
           call "buscadorclientes" using op, cli-clave,
           cli-numero, cli-direccion.

       cerrar-clientes.
           move "C" to op.
           call "buscadorclientes" using op, cli-clave,
           cli-numero, cli-direccion.

       mostrar-section.
           move "B" to op.
           move "01985067" to cli-clave.
           call "buscadorclientes" using op, cli-clave,
           cli-numero, cli-direccion.

           display "clav " cli-clave .
           display "dir " cli-direccion. 
           display "nro " cli-numero .
           display "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa".

