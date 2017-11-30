
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CREADOR-DE-ARCHIVOS-INDEXADOS.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       SELECT IN-ALQUILERES
           ASSIGN TO DISK "Entrada/alquileres.txt"
           ORGANIZATION IS LINE SEQUENTIAL
           FILE STATUS IS FS-IN-ALQUILERES.
       SELECT OUT-ALQUILERES-SEQ
           ASSIGN TO DISK "Entrada/indexados/alquileres.dat"
           ORGANIZATION IS INDEXED
           ACCESS MODE IS SEQUENTIAL
           RECORD KEY IS ALQ-CLAVE OF REG-OUT-ALQUILERES-SEQ
           FILE STATUS IS FS-OUT-ALQUILERES.
       SELECT OUT-ALQUILERES-RND
           ASSIGN TO DISK "Entrada/indexados/alquileres.dat"
           ORGANIZATION IS INDEXED
           ACCESS MODE IS SEQUENTIAL
           RECORD KEY IS ALQ-CLAVE OF REG-OUT-ALQUILERES-RND
           FILE STATUS IS FS-OUT-ALQUILERES.

       SELECT IN-CHOFERES
           ASSIGN TO DISK "Entrada/choferes.txt"
           ORGANIZATION IS LINE SEQUENTIAL
           FILE STATUS IS FS-IN-CHOFERES.
       SELECT OUT-CHOFERES-SEQ
           ASSIGN TO DISK "Entrada/indexados/choferes.dat"
           ORGANIZATION IS INDEXED
           ACCESS MODE IS SEQUENTIAL
           RECORD KEY IS CHO-CLAVE OF REG-OUT-CHOFERES-SEQ
           FILE STATUS IS FS-OUT-CHOFERES.
       SELECT OUT-CHOFERES-RND
           ASSIGN TO DISK "Entrada/indexados/choferes.dat"
           ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS CHO-CLAVE OF REG-OUT-CHOFERES-RND
           FILE STATUS IS FS-OUT-CHOFERES.

       SELECT IN-CLIENTES
           ASSIGN TO DISK "Entrada/clientes.txt"
           ORGANIZATION IS LINE SEQUENTIAL
           FILE STATUS IS FS-IN-CLIENTES.
       SELECT OUT-CLIENTES-SEQ
           ASSIGN TO DISK "Entrada/indexados/clientes.dat"
           ORGANIZATION IS INDEXED
           ACCESS MODE IS SEQUENTIAL
           RECORD KEY IS CLI-NUMERO OF REG-OUT-CLIENTES-SEQ
           ALTERNATE RECORD KEY IS CLI-NRO-DOC OF REG-OUT-CLIENTES-SEQ
           FILE STATUS IS FS-OUT-CLIENTES.
       SELECT OUT-CLIENTES-RND
           ASSIGN TO DISK "Entrada/indexados/clientes.dat"
           ORGANIZATION IS INDEXED
           ACCESS MODE IS RANDOM
           RECORD KEY IS CLI-NUMERO OF REG-OUT-CLIENTES-RND
           ALTERNATE RECORD KEY IS CLI-NRO-DOC OF REG-OUT-CLIENTES-RND
           FILE STATUS IS FS-OUT-CLIENTES.

       DATA DIVISION.

       FILE SECTION.

       FD IN-ALQUILERES
           LABEL RECORD IS STANDARD.
       01 REG-IN-ALQUILERES.
           03 ALQ-CLAVE.
               05  ALQ-PATENTE PIC X(6).
               05  ALQ-FECHA   PIC 9(8).
           03 ALQ-TIPO-DOC     PIC X.
           03 ALQ-NRO-DOC      PIC X(20).
           03 ALQ-IMPORTE      PIC 9(4)V99.
           03 ALQ-CHOFER       PIC X(7).
           03 ALQ-ESTADO       PIC X.
       FD OUT-ALQUILERES-RND
           LABEL RECORD IS STANDARD.
       01 REG-OUT-ALQUILERES-RND.
           03 ALQ-CLAVE.
               05  ALQ-PATENTE PIC X(6).
               05  ALQ-FECHA   PIC 9(8).
           03 ALQ-TIPO-DOC     PIC X.
           03 ALQ-NRO-DOC      PIC X(20).
           03 ALQ-IMPORTE      PIC 9(4)V99.
           03 ALQ-CHOFER       PIC X(7).
           03 ALQ-ESTADO       PIC X.
       FD OUT-ALQUILERES-SEQ
           LABEL RECORD IS STANDARD.
       01 REG-OUT-ALQUILERES-SEQ.
           03 ALQ-CLAVE.
               05  ALQ-PATENTE PIC X(6).
               05  ALQ-FECHA   PIC 9(8).
           03 ALQ-TIPO-DOC     PIC X.
           03 ALQ-NRO-DOC      PIC X(20).
           03 ALQ-IMPORTE      PIC 9(4)V99.
           03 ALQ-CHOFER       PIC X(7).
           03 ALQ-ESTADO       PIC X.

       FD IN-CHOFERES
           LABEL RECORD IS STANDARD.
        01 REG-IN-CHOFERES.
           03  CHO-CLAVE.
               05  CHO-NRO-LEGAJO  PIC X(7).
               05  CHO-FECHA-DESDE PIC 9(8).
           03  CHO-FECHA-HASTA     PIC 9(8).
           03  CHO-TURNO           PIC X.
       FD OUT-CHOFERES-RND
           LABEL RECORD IS STANDARD.
        01 REG-OUT-CHOFERES-RND.
           03  CHO-CLAVE.
               05  CHO-NRO-LEGAJO  PIC X(7).
               05  CHO-FECHA-DESDE PIC 9(8).
           03  CHO-FECHA-HASTA     PIC 9(8).
           03  CHO-TURNO           PIC X.
       FD OUT-CHOFERES-SEQ
           LABEL RECORD IS STANDARD.
        01 REG-OUT-CHOFERES-SEQ.
           03  CHO-CLAVE.
               05  CHO-NRO-LEGAJO  PIC X(7).
               05  CHO-FECHA-DESDE PIC 9(8).
           03  CHO-FECHA-HASTA     PIC 9(8).
           03  CHO-TURNO           PIC X.

       FD IN-CLIENTES
           LABEL RECORD IS STANDARD.
       01  REG-IN-CLIENTES.
           03  CLI-NUMERO      PIC X(8).
           03  CLI-ALTA        PIC 9(8).
           03  CLI-TELEF       PIC X(20).
           03  CLI-DIRECCION   PIC X(30).
           03  CLI-NRO-DOC     PIC X(20).
       FD OUT-CLIENTES-SEQ
           LABEL RECORD IS STANDARD.
       01  REG-OUT-CLIENTES-SEQ.
           03  CLI-NUMERO.
              05  CLI-NUM      PIC X(8).
           03  CLI-ALTA        PIC 9(8).
           03  CLI-TELEF       PIC X(20).
           03  CLI-DIRECCION   PIC X(30).
           03  CLI-NRO-DOC     PIC X(20).
       FD OUT-CLIENTES-RND
           LABEL RECORD IS STANDARD.
       01  REG-OUT-CLIENTES-RND.
           03  CLI-NUMERO.
              05  CLI-NUM      PIC X(8).
           03  CLI-ALTA        PIC 9(8).
           03  CLI-TELEF       PIC X(20).
           03  CLI-DIRECCION   PIC X(30).
           03  CLI-NRO-DOC     PIC X(20).


       WORKING-STORAGE SECTION.
       01 FS-IN-ALQUILERES       PIC XX.
       01 FS-OUT-ALQUILERES      PIC XX.
       01 CANT-ALQUILERES        PIC 9(10) VALUE ZEROES.

       01 FS-IN-CHOFERES       PIC XX.
       01 FS-OUT-CHOFERES      PIC XX.
       01 CANT-CHOFERES        PIC 9(10) VALUE ZEROES.

       01 FS-IN-CLIENTES       PIC XX.
       01 FS-OUT-CLIENTES      PIC XX.
       01 CANT-CLIENTES        PIC 9(10) VALUE ZEROES.

       01 WS-EXIT                PIC X.
       PROCEDURE DIVISION.
           PERFORM ABRIR-ARCHIVOS.
           PERFORM CREAR-ALQUILERES.
           PERFORM IMPRIMIR-ALQUILERES.
           PERFORM CREAR-CHOFERES.
           PERFORM IMPRIMIR-CHOFERES.
           PERFORM CREAR-CLIENTES.
           PERFORM IMPRIMIR-CLIENTES.
           PERFORM CERRAR-ARCHIVOS.
           ACCEPT WS-EXIT.
           STOP RUN.
       ABRIR-ARCHIVOS.
           OPEN INPUT IN-ALQUILERES.
           OPEN OUTPUT OUT-ALQUILERES-RND.
           OPEN INPUT IN-CHOFERES.
           OPEN OUTPUT OUT-CHOFERES-RND.
           OPEN INPUT IN-CLIENTES.
           OPEN OUTPUT OUT-CLIENTES-RND.

       *>
       *> ARCHIVO ALQUILERES
       *>
       CREAR-ALQUILERES.
           READ IN-ALQUILERES.
           PERFORM CARGAR-ALQUILERES UNTIL FS-IN-ALQUILERES <> 00.
           CLOSE OUT-ALQUILERES-RND.
       CARGAR-ALQUILERES.
           MOVE CORRESPONDING REG-IN-ALQUILERES TO
           REG-OUT-ALQUILERES-RND.
           MOVE CORRESPONDING REG-IN-ALQUILERES TO
           ALQ-CLAVE OF REG-OUT-ALQUILERES-RND.
           WRITE REG-OUT-ALQUILERES-RND.
           IF (FS-OUT-ALQUILERES <> 00)
               DISPLAY "ERROR AL ESCRIBIR EL ARCHIVO ALQUILERES: "
               FS-OUT-ALQUILERES.
           READ IN-ALQUILERES.
       IMPRIMIR-ALQUILERES.
           OPEN INPUT OUT-ALQUILERES-SEQ.
           READ OUT-ALQUILERES-SEQ.
           PERFORM CHEQUEO-ALQUILERES UNTIL FS-OUT-ALQUILERES <> 00.
           DISPLAY "--------------------".
           DISPLAY "TOTAL REGISTROS ALQUILERES: " CANT-ALQUILERES.
           CLOSE OUT-ALQUILERES-SEQ.
       CHEQUEO-ALQUILERES.
           DISPLAY "------ALQUILERES-------".
           DISPLAY "PATENTE: " ALQ-PATENTE OF REG-OUT-ALQUILERES-SEQ.
           DISPLAY "FECHA: " ALQ-FECHA OF REG-OUT-ALQUILERES-SEQ.
           DISPLAY "TIPO-DOC: " ALQ-TIPO-DOC OF REG-OUT-ALQUILERES-SEQ.
           DISPLAY "ALQ-NRO-DOC" ALQ-NRO-DOC OF REG-OUT-ALQUILERES-SEQ
           DISPLAY "ALQ-IMPORTE" ALQ-IMPORTE OF REG-OUT-ALQUILERES-SEQ
           DISPLAY "ALQ-CHOFER" ALQ-CHOFER OF REG-OUT-ALQUILERES-SEQ
           DISPLAY "ALQ-ESTADO" ALQ-ESTADO OF REG-OUT-ALQUILERES-SEQ
           ADD 1 TO CANT-ALQUILERES.
           READ OUT-ALQUILERES-SEQ.


       *>
       *> ARCHIVO CHOFERES
       *>
       CREAR-CHOFERES.
           READ IN-CHOFERES.
           PERFORM CARGAR-CHOFERES UNTIL FS-IN-CHOFERES <> 00.
           CLOSE OUT-CHOFERES-RND.
       CARGAR-CHOFERES.
           MOVE CORRESPONDING REG-IN-CHOFERES TO REG-OUT-CHOFERES-RND.
           MOVE CORRESPONDING REG-IN-CHOFERES TO
           CHO-CLAVE OF REG-OUT-CHOFERES-RND.
           WRITE REG-OUT-CHOFERES-RND.
           IF (FS-OUT-CHOFERES <> 00)
               DISPLAY "ERROR AL ESCRIBIR EL ARCHIVO CHOFERES: "
               FS-OUT-CHOFERES.
           READ IN-CHOFERES.
       IMPRIMIR-CHOFERES.
           OPEN INPUT OUT-CHOFERES-SEQ.
           READ OUT-CHOFERES-SEQ.
           PERFORM CHEQUEO-CHOFERES UNTIL FS-OUT-CHOFERES <> 00.
           DISPLAY "--------------------".
           DISPLAY "TOTAL REGISTROS CHOFERES: " CANT-CHOFERES.
           CLOSE OUT-CHOFERES-SEQ.
       CHEQUEO-CHOFERES.
           DISPLAY "------CHOFERES-------".
           DISPLAY "NRO-LEGAJO: " CHO-NRO-LEGAJO OF REG-OUT-CHOFERES-SEQ.
           DISPLAY "FECHA-DESDE: " CHO-FECHA-DESDE OF
           REG-OUT-CHOFERES-SEQ.
           DISPLAY "FECHA-HASTA: " CHO-FECHA-HASTA OF
           REG-OUT-CHOFERES-SEQ.
           DISPLAY "TURNO: " CHO-TURNO OF REG-OUT-CHOFERES-SEQ.
           ADD 1 TO CANT-CHOFERES.
           READ OUT-CHOFERES-SEQ.


       *>
       *> ARCHIVO CHOFERES
       *>
       CREAR-CLIENTES.
           READ IN-CLIENTES.
           PERFORM CARGAR-CLIENTES UNTIL FS-IN-CLIENTES <> 00.
           CLOSE OUT-CLIENTES-RND.
       CARGAR-CLIENTES.
           MOVE CORRESPONDING REG-IN-CLIENTES TO REG-OUT-CLIENTES-RND.
           MOVE CORRESPONDING REG-IN-CLIENTES TO
           CLI-NUMERO OF REG-OUT-CLIENTES-RND.
           WRITE REG-OUT-CLIENTES-RND.
           IF (FS-OUT-CLIENTES <> 00)
               DISPLAY "ERROR AL ESCRIBIR EL ARCHIVO CLIENTES: "
               FS-OUT-CLIENTES.
           READ IN-CLIENTES.
       IMPRIMIR-CLIENTES.
           OPEN INPUT OUT-CLIENTES-SEQ.
           READ OUT-CLIENTES-SEQ.
           PERFORM CHEQUEO-CLIENTES UNTIL FS-OUT-CLIENTES <> 00.
           DISPLAY "--------------------".
           DISPLAY "TOTAL REGISTROS CLIENTES: " CANT-CLIENTES.
           CLOSE OUT-CLIENTES-SEQ.
       CHEQUEO-CLIENTES.
           DISPLAY "------CLIENTES-------".
           DISPLAY "NUMERO: " CLI-NUMERO OF REG-OUT-CLIENTES-SEQ.
           DISPLAY "ALTA: " CLI-ALTA OF REG-OUT-CLIENTES-SEQ.
           DISPLAY "TELEF: " CLI-TELEF OF REG-OUT-CLIENTES-SEQ.
           DISPLAY "DIRECCION: " CLI-DIRECCION OF REG-OUT-CLIENTES-SEQ.
           DISPLAY "NRO-DOC: " CLI-NRO-DOC OF REG-OUT-CLIENTES-SEQ.
           ADD 1 TO CANT-CLIENTES.
           READ OUT-CLIENTES-SEQ.


       CERRAR-ARCHIVOS.
           CLOSE IN-ALQUILERES.
           CLOSE IN-CHOFERES.
           CLOSE IN-CLIENTES.
