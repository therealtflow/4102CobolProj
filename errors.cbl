000100 IDENTIFICATION DIVISION.
000200 PROGRAM-ID. errors.
000300
000400 ENVIRONMENT DIVISION.

       INPUT-OUTPUT SECTION.
           FILE-CONTROL.
           SELECT ACCOUNT ASSIGN TO 'accounts.txt'
               ORGANIZATION IS LINE SEQUENTIAL.



000500 DATA DIVISION.
           FILE SECTION.
           FD ACCOUNT.
           01 ACCOUNT-FILE.
               05 ACCOUNT-NUM PIC 9(5).
               05 NAME PIC A(5).
               05 ACCOUNT-BALANCE PIC 9(5).

       WORKING-STORAGE SECTION.
       01 WS-ACCOUNT-NUM PIC 9(5).
       01 WS-CHOICE PIC 9.
       01 WS-W-AMOUNT PIC 9(5).
       01 WS-D-AMOUNT PIC 9(5).
       01 WS-COUNT PIC 9(1) VALUE 0. 
       
       PROCEDURE DIVISION.

           OPEN INPUT ACCOUNT
           DISPLAY "Press Enter to check for any missing Account IDs"

           ACCEPT WS-ACCOUNT-NUM
           PERFORM UNTIL WS-COUNT = 9
               READ ACCOUNT
                   AT END
      *>                 DISPLAY "No Missing Account Numbers Found"
                       CLOSE ACCOUNT
                       STOP RUN
                   NOT AT END
                       IF WS-ACCOUNT-NUM IS = ACCOUNT-NUM
                           DISPLAY "No Missing account ID found"
                       ELSE IF WS-ACCOUNT-NUM IS NOT = ACCOUNT-NUM
                           DISPLAY "Missing account ID found"

      *> We need to figure out how to get only one of these if/ifelse statements to run and the program is finished

      *>                 IF ACCOUNT-NUM IS NOT = " "
                          
                       END-IF
               END-READ
           END-PERFORM
           CLOSE ACCOUNT.
           STOP RUN.
       END PROGRAM errors.