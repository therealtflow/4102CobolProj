       IDENTIFICATION DIVISION.
       PROGRAM-ID. ACCOUNT-CREATOR.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ACCOUNT-TABLE.
          02 ACCOUNT-ENTRY OCCURS 10 TIMES.
             03 NAME           PIC X(30).
             03 ACCOUNT-ID     PIC X(10).
             03 BALANCE        PIC 9(9)V99 VALUE 0.
             03 SSN            PIC X(9).
       
       PROCEDURE DIVISION.
       MAIN-LOGIC.
           DISPLAY "Welcome to Blue Magic Bank Account Creator".
           PERFORM INITIALIZE-ACCOUNT
           DISPLAY "Account Created Successfully!".
           DISPLAY "Account Details:".
           PERFORM DISPLAY-ACCOUNT
           STOP RUN.
       
       INITIALIZE-ACCOUNT.
           DISPLAY "Enter Name:".
           ACCEPT ACCOUNT-ENTRY(1).
           DISPLAY "Enter Account ID:".
           ACCEPT ACCOUNT-ENTRY(2).
           DISPLAY "Enter SSN:".
           ACCEPT ACCOUNT-ENTRY(4).
       
       DISPLAY-ACCOUNT.
           DISPLAY "Name: " ACCOUNT-ENTRY(1).
           DISPLAY "Account ID: " ACCOUNT-ENTRY(2).
           DISPLAY "Balance: " ACCOUNT-ENTRY(3).
           DISPLAY "SSN: " ACCOUNT-ENTRY(4).
       