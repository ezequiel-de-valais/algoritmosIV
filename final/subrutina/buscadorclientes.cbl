        IDENTIFICATION DIVISION.
        PROGRAM-ID. buscadorclientes.

        ENVIRONMENT DIVISION.
        CONFIGURATION SECTION.
        SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

        INPUT-OUTPUT SECTION.

        FILE-CONTROL.

		    SELECT clientes-rdm
        ASSIGN TO DISK "entrada/indexados/clientes.dat"
        ORGANIZATION IS INDEXED
        ACCESS MODE IS RANDOM
        RECORD KEY IS cli-clave of rec-clientes-rdm
        FILE STATUS IS fs-clientes-rdm.


        DATA DIVISION.
        FILE SECTION.
        
        
        FD clientes-rdm LABEL RECORD IS STANDARD.
        01 rec-clientes-rdm.
           03 cli-clave pic 9(8).
           03 cli-fecha-uno pic 9(8).
           03 cli-fecha-dos pic 9(8).
           03 cli-vacio pic x(12).
           03 cli-dir pic x(30).
           03 cli-numero pic 9(8).
           03 cli-vaciod pic x(12).

        WORKING-STORAGE SECTION.


        01 fs-clientes-rdm pic xx.
           88 ok-cli-rd  value "00".
           88 no-cli-rd  value "23".
           88 eof-cli-rd value "10".



       linkage section.
        01 op   pic x.
        01 cli-clave-in   pic 9(8).
        01 cli-numero-out          pic x(8).
        01 cli-direccion-out       pic x(30).


        PROCEDURE DIVISION USING op, cli-clave-in,
           cli-numero-out, cli-direccion-out.

           IF op equal to "A"
              PERFORM open-files
           END-IF.
           IF op equal to "B"
              PERFORM searchcliente
           END-IF.
           IF op equal to "C"
              PERFORM close-files
           END-IF.

           goback.

        open-files.
           open input clientes-rdm.
           if not ok-cli-rd
           	 display "error abriendo clientes-rdm"
             stop run
           end-if.


        close-files.
           close clientes-rdm.


        leer-cliente.
           READ clientes-rdm.

        searchcliente.
           move cli-clave-in to cli-clave.
           READ clientes-rdm key is cli-clave.
           move cli-dir to cli-direccion-out.
           move cli-numero to cli-numero-out.
           