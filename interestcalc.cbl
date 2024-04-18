       IDENTIFICATION DIVISION.
       PROGRAM-ID. InterestCalculator.

       DATA DIVISION.
           WORKING-STORAGE SECTION.
           01 InitialDeposit    PIC 9(5)V99.
           01 InterestRate      PIC 9(3)V9(2).
           01 TimePeriod        PIC 9(2).
           01 Interest          PIC 9(5)V99.
           01 TotalAmount       PIC 9(7)V99.
           01 Choice            PIC 9.

       PROCEDURE DIVISION.
           PERFORM UNTIL Choice = '2'
                Display "Enter Initial Deposit Amount (up to 5 digits, 
      -         "one decimal place):"
                Accept InitialDeposit
                Display "Enter Interest Rate (i.e., 3.75 for 3.75%):"
                Accept InterestRate
                Display "Enter Time Period (in years, up to 2 digits):"
                Accept TimePeriod

                Display "Please review your input: "
                Display "Interest Deposit Amount: ", InitialDeposit
                Display "Interest Rate % per yr: ", InterestRate
                Display "Time Period (yrs): ", TimePeriod
                Display "Would you like to continue? Enter 1 to compute 
      -         "or 2 to exit"

                Accept Choice
                If Choice = '1'
                    Compute Interest = (InitialDeposit * InterestRate * 
                    TimePeriod) / 100
                    Compute TotalAmount = InitialDeposit + Interest

                    Display "Interest Amount: ", Interest
                    Display "Total Amount after Interest: ", TotalAmount
                Else If Choice = '2'
                    Display "Exiting program..."
                Else
                    Display "Invalid choice... Please try again..."
                END-IF
           END-PERFORM
           STOP RUN.
