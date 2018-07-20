        IDENTIFICATION DIVISION.
        PROGRAM-ID. subrutina.

        ENVIRONMENT DIVISION.
        CONFIGURATION SECTION.
        SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

        INPUT-OUTPUT SECTION.

        FILE-CONTROL.

        SELECT clientes
        ASSIGN TO DISK "entrada/clientes.txt"
        ORGANIZATION IS LINE SEQUENTIAL
        ACCESS MODE IS SEQUENTIAL
        FILE STATUS IS fs-clientes.

		SELECT clientes-rdm
        ASSIGN TO DISK "entrada/indexados/clientes.dat"
        ORGANIZATION IS INDEXED
        ACCESS MODE IS RANDOM
        RECORD KEY IS cli-clave of rec-clientes-rdm
        FILE STATUS IS fs-clientes-rdm.

		SELECT clientes-seq
        ASSIGN TO DISK "entrada/indexados/clientes.dat"
        ORGANIZATION IS INDEXED
        ACCESS MODE IS SEQUENTIAL
        RECORD KEY IS cli-clave of rec-clientes-seq
        FILE STATUS IS fs-clientes-seq.


        DATA DIVISION.
        FILE SECTION.
        
        FD clientes LABEL RECORD IS STANDARD.
        01 rec-clientes.
           03 cli-clave pic 9(8).
           03 cli-fecha-uno pic 9(8).
           03 cli-fecha-dos pic 9(8).
           03 cli-vacio pic x(12).
           03 cli-dir pic x(30).
           03 cli-numero pic 9(8).
           03 cli-vaciod pic x(12).
        
        FD clientes-rdm LABEL RECORD IS STANDARD.
        01 rec-clientes-rdm.
           03 cli-clave pic 9(8).
           03 cli-fecha-uno pic 9(8).
           03 cli-fecha-dos pic 9(8).
           03 cli-vacio pic x(12).
           03 cli-dir pic x(30).
           03 cli-numero pic 9(8).
           03 cli-vaciod pic x(12).

        FD clientes-seq LABEL RECORD IS STANDARD.
        01 rec-clientes-seq.
           03 cli-clave pic 9(8).
           03 cli-fecha-uno pic 9(8).
           03 cli-fecha-dos pic 9(8).
           03 cli-vacio pic x(12).
           03 cli-dir pic x(30).
           03 cli-numero pic 9(8).
           03 cli-vaciod pic x(12).


        WORKING-STORAGE SECTION.

        01 fs-clientes pic xx.
           88 ok-cli  value "00".
           88 no-cli  value "23".
           88 eof-cli  value "10".

        01 fs-clientes-rdm pic xx.
           88 ok-cli-rd  value "00".
           88 no-cli-rd  value "23".
           88 eof-cli-rd value "10".

        01 fs-clientes-seq pic xx.
           88 ok-cli-sq  value "00".
           88 no-cli-sq  value "23".
           88 eof-cli-sq value "10".



        PROCEDURE DIVISION.
           PERFORM open-files.
           PERFORM indexar.
           PERFORM close-files.
           PERFORM mostrar.
           stop run.


        open-files.
           open input clientes.
           if not ok-cli
           	 display "error abriendo clientes"
             stop run
           end-if.

           open output clientes-rdm.
           if not ok-cli-rd
           	 display "error abriendo clientes-rdm"
             stop run
           end-if.


        close-files.
           close clientes.
           close clientes-rdm.


        leer-cliente.
           READ clientes.

        leer-cliente-seq.
           READ clientes-seq.

        indexar.
           PERFORM leer-cliente.
           PERFORM procesar-cliente UNTIL eof-cli.



        procesar-cliente.
           move corresponding rec-clientes to rec-clientes-rdm.
           display "clave " cli-clave of rec-clientes-rdm.
           display "dir " cli-dir of rec-clientes-rdm.
           write rec-clientes-rdm.
           if not ok-cli-rd
              display "error escribiendo clirdm"
              stop run
           end-if.
           perform leer-cliente.

        mostrar.
           open input clientes-seq.
           if not ok-cli-sq
            display "error leyendo seq"
            stop run
           end-if.
           display "separador qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq"
           PERFORM leer-cliente-seq.
           PERFORM procesar-cliente-seq UNTIL eof-cli-sq.
           close clientes-seq.

        procesar-cliente-seq.
           display "clave  seq " cli-clave of rec-clientes-seq.
           display "clave  dir " cli-dir of rec-clientes-seq.
           perform leer-cliente-seq.
           