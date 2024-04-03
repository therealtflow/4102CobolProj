000100 IDENTIFICATION DIVISION.
000200 PROGRAM-ID. transactions.
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
       
       PROCEDURE DIVISION.

           OPEN INPUT ACCOUNT
           DISPLAY "Please enter your account number: "
      *>         DISPLAY "Enter 0 to exit."
           ACCEPT WS-ACCOUNT-NUM
           PERFORM UNTIL ACCOUNT-NUM = WS-ACCOUNT-NUM
               READ ACCOUNT
                   AT END
                       DISPLAY "Account not found"
                       CLOSE ACCOUNT
                       STOP RUN
                   NOT AT END
                       IF ACCOUNT-NUM = WS-ACCOUNT-NUM
                           DISPLAY "Account found"
                           MOVE FUNCTION TRIM(NAME) TO NAME
                           MOVE FUNCTION TRIM(ACCOUNT-BALANCE) 
                           TO ACCOUNT-BALANCE
                           DISPLAY ACCOUNT-NUM
                           DISPLAY NAME
                           DISPLAY "BALANCE: " ACCOUNT-BALANCE
                       END-IF
               END-READ
           END-PERFORM
           DISPLAY "Options"
           DISPLAY "1. Enter 1 to withdraw"
           DISPLAY "2. Enter 2 to deposit"
           ACCEPT WS-CHOICE
           IF WS-CHOICE = '1'
               DISPLAY "Enter amount: " 
               ACCEPT WS-W-AMOUNT
               IF WS-W-AMOUNT > ACCOUNT-BALANCE
                   DISPLAY "Insufficient balance"
                   CLOSE ACCOUNT
                   STOP RUN
               END-IF
               COMPUTE ACCOUNT-BALANCE = 
               ACCOUNT-BALANCE - WS-W-AMOUNT
               DISPLAY "Account balance: " ACCOUNT-BALANCE
           ELSE IF WS-CHOICE = 2
               DISPLAY "Enter amount: "
               ACCEPT WS-D-AMOUNT
               COMPUTE ACCOUNT-BALANCE = 
               ACCOUNT-BALANCE + WS-D-AMOUNT
               DISPLAY "Account balance: " ACCOUNT-BALANCE
           ELSE
               DISPLAY "Invalid choice."
           END-IF
           CLOSE ACCOUNT.
           STOP RUN.
       END PROGRAM transactions.
                  
     
