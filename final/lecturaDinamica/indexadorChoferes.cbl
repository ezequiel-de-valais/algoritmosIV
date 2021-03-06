
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CREADOR-DE-ARCHIVOS-INDEXADOS.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.


       SELECT IN-CHOFERES
           ASSIGN TO DISK "Entrada/choferes.txt"
           ORGANIZATION IS LINE SEQUENTIAL
           FILE STATUS IS FS-IN-CHOFERES.
       SELECT OUT-CHOFERES-SEQ
           ASSIGN TO DISK "Entrada/indexados/choferes.dat"
           ORGANIZATION IS INDEXED
           ACCESS MODE IS SEQUENTIAL
           RECORD KEY IS CHO-CLAVE OF REG-OUT-CHOFERES-SEQ
           alternate RECORD KEY IS CHO-NRO-LEGAJO OF REG-OUT-CHOFERES-SEQ WITH duplicates
           FILE STATUS IS FS-OUT-CHOFERES.
       SELECT OUT-CHOFERES-RND
           ASSIGN TO DISK "Entrada/indexados/choferes.dat"
           ORGANIZATION IS INDEXED
           ACCESS MODE IS RANDOM
           RECORD KEY IS CHO-CLAVE OF REG-OUT-CHOFERES-RND
           alternate RECORD KEY IS CHO-NRO-LEGAJO OF REG-OUT-CHOFERES-RND WITH duplicates
           FILE STATUS IS FS-OUT-CHOFERES.

   

       DATA DIVISION.

       FILE SECTION.

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


       WORKING-STORAGE SECTION.
       01 FS-IN-CHOFERES       PIC XX.
       01 FS-OUT-CHOFERES      PIC XX.
       01 CANT-CHOFERES        PIC 9(10) VALUE ZEROES.

       01 WS-EXIT                PIC X.
       PROCEDURE DIVISION.
           PERFORM ABRIR-ARCHIVOS.
           PERFORM CREAR-CHOFERES.
           PERFORM IMPRIMIR-CHOFERES.
           PERFORM CERRAR-ARCHIVOS.
           ACCEPT WS-EXIT.
           STOP RUN.
       ABRIR-ARCHIVOS.
           OPEN INPUT IN-CHOFERES.
           OPEN OUTPUT OUT-CHOFERES-RND.

      

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



       CERRAR-ARCHIVOS.
           CLOSE IN-CHOFERES.
