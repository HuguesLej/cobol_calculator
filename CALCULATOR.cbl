       IDENTIFICATION DIVISION.
       PROGRAM-ID. CALCULATOR.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 CL-OPERAND-ONE           PIC S9(10)
                   SIGN IS LEADING SEPARATE CHARACTER.
       01 CL-OPERAND-TWO           PIC S9(10)
                   SIGN IS LEADING SEPARATE CHARACTER.
       01 CL-OPERATOR              PIC X(2).
       01 CL-OPERATION-STRING      PIC X(100).

       01 CL-RESULT                PIC S9(20)
                   SIGN IS LEADING SEPARATE CHARACTER       VALUE 0.
       01 CL-CLEAN-RESULT          PIC -Z(20).
       01 CL-STR-RESULT            PIC X(21).
       01 CL-REMAINDER             PIC S9(20)
                   SIGN IS LEADING SEPARATE CHARACTER       VALUE 0.
       01 CL-EXPONENT-COUNT        PIC S9(10)
                   SIGN IS LEADING SEPARATE CHARACTER       VALUE 0.

       PROCEDURE DIVISION.
           PERFORM 1000-GET-DATA.
           PERFORM 2000-CALCULATE.
           PERFORM 3000-DISPLAY.
           STOP RUN.

       1000-GET-DATA SECTION.
       1000-INITIALIZE-DATA.
           INITIALIZE CL-OPERAND-ONE.
           INITIALIZE CL-OPERAND-TWO.
           INITIALIZE CL-OPERATOR.
           INITIALIZE CL-OPERATION-STRING.
           INITIALIZE CL-CLEAN-RESULT.
       1000-ACCEPT-DATA.
           DISPLAY "Enter your calculation.".
           DISPLAY "You have to use 2 operands and one operator, "
                   "separate by at least one space.".
           DISPLAY "Operands must be integers with no more than 10 "
                   "digits each.".
           DISPLAY "Allowed operator are +, -, *, **, /, %.".
           DISPLAY "For now, all operands have to be positive.".
           DISPLAY SPACES.

           ACCEPT CL-OPERATION-STRING.
       1000-PARSE-DATA.
           UNSTRING CL-OPERATION-STRING DELIMITED BY ALL SPACE
               INTO
                   CL-OPERAND-ONE
                   CL-OPERATOR
                   CL-OPERAND-TWO
               ON OVERFLOW
                   DISPLAY "Overflow! Please verify the length of your"
                           " operands."
           END-UNSTRING.

       2000-CALCULATE SECTION.
           IF CL-OPERATOR EQUAL "+"
               PERFORM 4000-ADD
           END-IF.
           IF CL-OPERATOR EQUAL "-"
               PERFORM 4000-SUBTRACT
           END-IF.
           IF CL-OPERATOR EQUAL "*"
               PERFORM 4000-MULTIPLY
           END-IF.
           IF CL-OPERATOR EQUAL "**"
               PERFORM 4000-EXPONENT
           END-IF.
           IF CL-OPERATOR EQUAL "/"
               PERFORM 4000-DIVIDE
           END-IF.
           IF CL-OPERATOR EQUAL "%"
               PERFORM 4000-MODULO
           END-IF.

       3000-DISPLAY SECTION.
           IF CL-RESULT = 0
               DISPLAY "0"
           ELSE
               MOVE CL-RESULT TO CL-CLEAN-RESULT
               UNSTRING CL-CLEAN-RESULT DELIMITED BY ALL SPACE
                   INTO CL-STR-RESULT
                        CL-STR-RESULT
               END-UNSTRING
               IF CL-RESULT < 0
                   DISPLAY "         -" CL-STR-RESULT
               ELSE
                      DISPLAY "          " CL-STR-RESULT
               END-IF
           END-IF.

       4000-OPERATORS SECTION.
       4000-ADD.
           ADD CL-OPERAND-ONE TO CL-OPERAND-TWO GIVING CL-RESULT.
       4000-SUBTRACT.
           SUBTRACT CL-OPERAND-ONE FROM CL-OPERAND-TWO GIVING CL-RESULT.
           IF CL-RESULT > 0 AND CL-OPERAND-TWO > CL-OPERAND-ONE
               MULTIPLY -1 BY CL-RESULT.
       4000-MULTIPLY.
           MULTIPLY CL-OPERAND-ONE BY CL-OPERAND-TWO GIVING CL-RESULT.
       4000-EXPONENT.
           COMPUTE CL-RESULT = 1.
           PERFORM UNTIL CL-EXPONENT-COUNT EQUAL CL-OPERAND-TWO
               MULTIPLY CL-OPERAND-ONE BY CL-RESULT
               ADD 1 TO CL-EXPONENT-COUNT
           END-PERFORM.
       4000-DIVIDE.
           DIVIDE CL-OPERAND-ONE BY CL-OPERAND-TWO GIVING CL-RESULT
               REMAINDER CL-REMAINDER.
       4000-MODULO.
           DIVIDE CL-OPERAND-ONE BY CL-OPERAND-TWO GIVING CL-RESULT
               REMAINDER CL-REMAINDER.
           COMPUTE CL-RESULT = CL-REMAINDER.

       END PROGRAM CALCULATOR.
