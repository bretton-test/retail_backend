Unit Infix;

{ ------------------------------------------------------------------------
  INFIX.PAS
  ------------------------------------------------------------------------

    This unit uses recursive descent to evaluate expressions
    written in infix notation.  The operations addition (+),
    subtraction (-), multiplication (*), and division (/) are supported,
    as are the functions ABS, ARCTAN, COS, EXP, LN, SQR, and SQRT.
    PI returns the value for pi.  Results exceeding 1.0E37 are reported
    as overflows.  Results less than 1.0E-37 are set to zero.
 
         Written by:

         James L. Dean
         406 40th Street
         New Orleans, LA 70124
         February 25, 1985

         Modified by:

         David J. Firth
         5665-A2 Parkville St.
         Columbus, OH 43229
         December 26, 1991

     This code was originally written as a stand-alone program using
     standard Pascal.  In that form the program wasn't very useful.
     I have taken the code and reorganized it for use with Turbo Pascal
     versions 5.x or 6.0.  In addition, I have reworked it to support
     variables by adding a preprocessor.  The variables are preceded and
     followed by a @ symbol, are case sensitive, and must be less than
     20 characters long (including the 2 @s). For example, the
     following would all be valid variables:

     @VARIABLE1@      @Pressure3@      @AngleOfAttack@

     Variable identifiers are passed around as strings.

     Calculation results may either be stored in variables or returned
     raw to the caller.  Raw calculations may not contain variables,
     since the raw procedure calls are sent directly to the original
     code.

     As a final note, the original code is virtually unreadable due
     to the original author's lack of any comments.  I have attempted
     to provide a front end to this code that is useful and understandable.

     Your comments are welcome (and desired!). My E-Mail addresses
     are:

     GEnie:     D.FIRTH
     CIS:       76467,1734
}

Interface

type

  Str20 = string[20];                 {store variable IDs this way to conserve}

  VariablePtr = ^VariableType;        {for dynamic allocation of records }

  VariableType = record
    ID    : Str20;                    {the id of the variable, with @s   }
    Value : real;                     {the current value of the variable }
    Next  : VariablePtr;              {hook to next record in linked list}
  end; {VariableType}

var

  HPtr,                               {head of variable list       }
  TPtr,                               {tail of variable list       }
  SPtr  : VariablePtr;                {used to search variable list}

  CalcError : integer;                {the position of the error   }

procedure StoreVariable(VariableID:str20;MyValue:real);
procedure ReadVariable(VariableID:str20;var MyValue:real;var MyError:boolean);
procedure DestroyList;

procedure RawCalculate(MyFormula:string;var MyResult:real;var MyError:byte);
procedure Calculate(MyFormula:string;var MyResult:real;var MyError:byte);
procedure CalcAndStore(MyFormula:string;StoreID:str20;var MyError:byte);

Implementation

{ ------------------------------------------------------------------------ }

  TYPE

    argument_record_ptr = ^argument_record;

    argument_record = RECORD
                        value : REAL;
                        next_ptr : argument_record_ptr
                      END;

    string_1 = STRING[1];

    string_255 = STRING[255];

  VAR

    error_detected              : BOOLEAN;
    error_msg                   : string_255;
    expression                  : string_255; 
    expression_index            : INTEGER;
    expression_length           : INTEGER;
    xresult                     : REAL;	{ 8/11/95 dfn: result -> xresult }

{ ------------------------------------------------------------------------ }

  PROCEDURE set_error(msg : string_255);
    BEGIN
      error_detected:=TRUE;
      error_msg
       :='Error:  '+msg+'.'
    END;

{ ------------------------------------------------------------------------ }

  PROCEDURE eat_leading_spaces;
    VAR
      non_blank_found           : BOOLEAN;
    BEGIN
      non_blank_found:=FALSE;
      WHILE((expression_index <= expression_length)
      AND   (NOT non_blank_found)) DO
        IF expression[expression_index] = ' ' THEN
          expression_index:=expression_index+1
        ELSE
          non_blank_found:=TRUE
    END;

{ ------------------------------------------------------------------------ }

  FUNCTION unsigned_integer : REAL;
    VAR
      non_digit_found           : BOOLEAN;
      overflow                  : BOOLEAN;
      xresult                   : REAL;	{ 8/11/95 dfn: result -> xresult }
      tem_char                  : CHAR;
      tem_real                  : REAL;
    BEGIN
      non_digit_found:=FALSE;
      xresult:=0.0;
      overflow:=FALSE;
      REPEAT
        tem_char:=expression[expression_index];
        IF ((tem_char >= '0') AND (tem_char <= '9')) THEN
          BEGIN
            tem_real:=ORD(tem_char)-ORD('0');
            IF xresult > 1.0E36 THEN
              overflow:=TRUE
            ELSE
              BEGIN
                xresult:=10.0*xresult+tem_real;
                expression_index:=expression_index+1;
                IF expression_index > expression_length THEN
                  non_digit_found:=TRUE
              END
          END
        ELSE
          non_digit_found:=TRUE
      UNTIL ((non_digit_found) OR (overflow));
      IF overflow THEN
        set_error('constant is too big');
      unsigned_integer:=xresult
    END;

{ ------------------------------------------------------------------------ }

  FUNCTION unsigned_number : REAL;
    VAR
      exponent_value            : REAL;
      exponent_sign             : CHAR;
      factor                    : REAL;
      non_digit_found           : BOOLEAN;
      xresult                   : REAL; { 8/11/95 dfn: result -> xresult }
      tem_char                  : CHAR;
      tem_real_1                : REAL;
      tem_real_2                : REAL;
    BEGIN
      xresult:=unsigned_integer;
      IF (NOT error_detected) THEN
        BEGIN
          IF expression_index <= expression_length THEN
            BEGIN
              tem_char:=expression[expression_index];
              IF (tem_char = '.') or (tem_char = ',') THEN
                              BEGIN
                  tem_real_1:=xresult;
                  expression_index:=expression_index+1;
                  IF expression_index > expression_length THEN
                    set_error(
            'end of expression encountered where decimal part expected')
                  ELSE
                    BEGIN
                      tem_char:=expression[expression_index];
                      IF ((tem_char >= '0') AND (tem_char <= '9')) THEN
                        BEGIN
                          factor:=1.0;
                          non_digit_found:=FALSE;
                          WHILE (NOT non_digit_found) DO
                            BEGIN
                              factor:=factor/10.0;
                              tem_real_2:=ORD(tem_char)-ORD('0');
                              tem_real_1:=tem_real_1+factor*tem_real_2;
                              expression_index:=expression_index+1;
                              IF expression_index > expression_length THEN
                               non_digit_found:=TRUE
                              ELSE
                                BEGIN
                                  tem_char
                                   :=expression[expression_index];
                                  IF ((tem_char < '0')
                                  OR  (tem_char > '9')) THEN
                                    non_digit_found:=TRUE
                                END
                            END;
                          xresult:=tem_real_1
                        END
                      ELSE
                        set_error(
                         'decimal part of real number is missing')
                    END
                END;
              IF (NOT error_detected) THEN
                BEGIN
                  IF expression_index <= expression_length THEN
                    BEGIN
                      IF ((tem_char = 'e') OR (tem_char = 'E')) THEN
                        BEGIN
                          expression_index:=expression_index+1;
                          IF expression_index > expression_length THEN
                            set_error(
               'end of expression encountered where exponent expected')
                         ELSE
                            BEGIN
                              tem_char
                               :=expression[expression_index];
                              IF ((tem_char = '+')
                              OR  (tem_char = '-')) THEN
                                BEGIN
                                  exponent_sign:=tem_char;
                                  expression_index:=expression_index+1
                                END
                              ELSE
                                exponent_sign:=' ';
                              IF expression_index > expression_length
                               THEN
                                set_error(
     'end of expression encountered where exponent magnitude expected')
                              ELSE
                                BEGIN
                                  tem_char:=expression[expression_index];
                                 IF ((tem_char >= '0')
                                  AND (tem_char <= '9')) THEN
                                    BEGIN
                                      exponent_value
                                       :=unsigned_integer;
                                      IF (NOT error_detected) THEN
                                        BEGIN
                                          IF exponent_value > 37.0 THEN
                                            set_error(
                                   'magnitude of exponent is too large')
                                          ELSE
                                            BEGIN
                                              tem_real_1:=1.0;
                                              WHILE (exponent_value > 0.0) DO
                                                BEGIN
                                                  exponent_value
                                                   :=exponent_value-1.0;
                                                  tem_real_1:=10.0*tem_real_1
                                                END;
                                              IF exponent_sign = '-' THEN
                                               tem_real_1
                                                :=1.0/tem_real_1;
                                              IF xresult <> 0.0 THEN
                                                BEGIN
                                                  tem_real_2
                                                   :=(LN(tem_real_1)
                                                   +LN(ABS(xresult)))
                                                   /LN(10.0);
                                                  IF tem_real_2 < -37.0 THEN
                                                    xresult:=0.0
                                                  ELSE
                                                    IF tem_real_2 > 37.0 THEN
                                                      set_error(
                                                       'constant is too big')
                                                    ELSE
                                                      xresult:=xresult*tem_real_1
                                                END
                                            END
                                        END
                                    END
                                  ELSE
                                    set_error(
                                     'nonnumeric exponent encountered')
                                END
                            END
                        END
                    END
                END
            END
        END;
      unsigned_number:=xresult
    END;

{ ------------------------------------------------------------------------ }

  FUNCTION pop_argument(VAR argument_stack_head : argument_record_ptr) : REAL;
    VAR
      argument_stack_ptr        : argument_record_ptr;
      xresult                   : REAL;  { 8/11/95 dfn: result -> xresult }
    BEGIN
      xresult:=argument_stack_head^.value;
      argument_stack_ptr:=argument_stack_head^.next_ptr;
      DISPOSE(argument_stack_head);
      argument_stack_head:=argument_stack_ptr;
      pop_argument:=xresult
    END;

{ ------------------------------------------------------------------------ }

  FUNCTION abs_function(VAR argument_stack_head : argument_record_ptr;
   VAR function_name : string_255) : REAL;
    VAR
      argument                  : REAL;
      xresult                   : REAL;   { 8/11/95 dfn: result -> xresult }
    BEGIN
      xresult:=0.0;
      IF argument_stack_head = NIL THEN
        set_error('argument to "'+function_name+'" is missing')
      ELSE
        BEGIN
          argument:=pop_argument(argument_stack_head);
          IF argument_stack_head = NIL THEN
            IF argument >= 0.0 THEN
              xresult:=argument
            ELSE
              xresult:=-argument
          ELSE
            set_error(
             'extraneous argument supplied to function "'+
             function_name+'"')
        END;
      abs_function:=xresult
    END;

{ ------------------------------------------------------------------------ }

  FUNCTION arctan_function(VAR argument_stack_head : argument_record_ptr;
   VAR function_name : string_255) : REAL;
    VAR
      argument                  : REAL;
      xresult                   : REAL; { 8/11/95 dfn: result -> xresult }
    BEGIN
      xresult:=0.0;
      IF argument_stack_head = NIL THEN
       set_error(
        'argument to "'+function_name+'" is missing')
      ELSE
        BEGIN
          argument:=pop_argument(argument_stack_head);
          IF argument_stack_head = NIL THEN
            xresult:=ARCTAN(argument)
          ELSE
            set_error(
             'extraneous argument supplied to function "'+
             function_name+'"')
        END;
      arctan_function:=xresult
    END;

{ ------------------------------------------------------------------------ }

  FUNCTION cos_function(VAR argument_stack_head : argument_record_ptr;
   VAR function_name : string_255) : REAL;
    VAR
      argument                  : REAL;
      xresult                   : REAL;  { 8/11/95 dfn: result -> xresult }
    BEGIN
      xresult:=0.0;
      IF argument_stack_head = NIL THEN
        set_error('argument to "'+function_name+'" is missing')
      ELSE
        BEGIN
          argument:=pop_argument(argument_stack_head);
          IF argument_stack_head = NIL THEN
            xresult:=COS(argument)
          ELSE
            set_error(
             'extraneous argument supplied to function "'+
             function_name+'"')
        END;
      cos_function:=xresult
    END;

{ ------------------------------------------------------------------------ }

  FUNCTION exp_function(VAR argument_stack_head : argument_record_ptr;
   VAR function_name : string_255) : REAL;
    VAR
      argument                  : REAL;
      xresult                   : REAL; { 8/11/95 dfn: result -> xresult }
      tem_real                  : REAL;
    BEGIN
      xresult:=0.0;
      IF argument_stack_head = NIL THEN
        set_error('argument to "'+function_name+'" is missing')
      ELSE
        BEGIN
          argument:=pop_argument(argument_stack_head);
          IF argument_stack_head = NIL THEN
            BEGIN
              tem_real:=argument/LN(10.0);
              IF tem_real < -37.0 THEN
                xresult:=0.0
              ELSE
                IF tem_real > 37.0 THEN
                  set_error(
                   'overflow detected while calculating "'+
                   function_name+'"')
                ELSE
                  xresult:=EXP(argument)
            END
          ELSE
            set_error(
             'extraneous argument supplied to function "'+
             function_name+'"')
        END;
      exp_function:=xresult
    END;

{ ------------------------------------------------------------------------ }

  FUNCTION ln_function(VAR argument_stack_head : argument_record_ptr;
   VAR function_name : string_255) : REAL;
    VAR
      argument                  : REAL;
      xresult                   : REAL; { 8/11/95 dfn: result -> xresult }
    BEGIN
      xresult:=0.0;
      IF argument_stack_head = NIL THEN
        set_error(
         'argument to "'+function_name+'" is missing')
      ELSE
        BEGIN
          argument:=pop_argument(argument_stack_head);
          IF argument_stack_head = NIL THEN
            IF argument <= 0.0 THEN
              set_error(
               'argument to "'+function_name+
               '" is other than positive')
            ELSE
              xresult:=LN(argument)
          ELSE
            set_error(
             'extraneous argument supplied to function "'+
             function_name+'"')
        END;
      ln_function:=xresult
    END;

{ ------------------------------------------------------------------------ }

  FUNCTION pi_function(VAR argument_stack_head : argument_record_ptr;
   VAR function_name : string_255) : REAL;
    VAR
     // argument                  : REAL;
      xresult                   : REAL;	{ 8/11/95 dfn: result -> xresult }
    BEGIN
      xresult:=0.0;
      IF argument_stack_head = NIL THEN
        xresult:=4.0*ARCTAN(1.0)
      ELSE
        set_error(
         'extraneous argument supplied to function "'+
         function_name+'"');
      pi_function:=xresult
    END;

{ ------------------------------------------------------------------------ }

  FUNCTION sin_function(VAR argument_stack_head : argument_record_ptr;
   VAR function_name : string_255) : REAL;
    VAR
      argument                  : REAL;
      xresult                   : REAL;	{ 8/11/95 dfn: result -> xresult }
    BEGIN
      xresult:=0.0;
      IF argument_stack_head = NIL THEN
        set_error(
         'argument to "'+function_name+'" is missing')
      ELSE
        BEGIN
          argument:=pop_argument(argument_stack_head);
          IF argument_stack_head = NIL THEN
            xresult:=SIN(argument)
          ELSE
            set_error(
             'extraneous argument supplied to function "'+
             function_name+'"')
        END;
      sin_function:=xresult
    END;

{ ------------------------------------------------------------------------ }

  FUNCTION sqr_function(VAR argument_stack_head : argument_record_ptr;
   VAR function_name : string_255) : REAL;
    VAR
      argument                  : REAL;
      xresult                   : REAL;	{ 8/11/95 dfn: result -> xresult }
      tem_real                  : REAL;
    BEGIN
      xresult:=0.0;
      IF argument_stack_head = NIL THEN
        set_error(
         'argument to "'+function_name+'" is missing')
      ELSE
        BEGIN
          argument:=pop_argument(argument_stack_head);
          IF argument_stack_head = NIL THEN
            IF argument = 0.0 THEN
              xresult:=0.0
            ELSE
              BEGIN
                tem_real:=2.0*LN(ABS(argument))/LN(10.0);
                IF tem_real < -37.0 THEN
                  xresult:=0.0
                ELSE
                  IF tem_real > 37.0 THEN
                    set_error(
                     'overflow detected during calculation of "'+
                     function_name+'"')
                  ELSE
                    xresult:=argument*argument
              END
          ELSE
            set_error(
             'extraneous argument supplied to function "'+
             function_name+'"')
        END;
      sqr_function:=xresult
    END;

{ ------------------------------------------------------------------------ }

  FUNCTION sqrt_function(VAR argument_stack_head : argument_record_ptr;
   VAR function_name : string_255) : REAL;
    VAR
      argument                  : REAL;
      xresult                   : REAL;  { 8/11/95 dfn: result -> xresult }
    BEGIN
      xresult:=0.0;
      IF argument_stack_head = NIL THEN
        set_error(
         'argument to "'+function_name+'" is missing')
      ELSE
        BEGIN
          argument:=pop_argument(argument_stack_head);
          IF argument_stack_head = NIL THEN
            IF argument < 0.0 THEN
              set_error(
               'argument to "'+function_name+
               '" is negative')
            ELSE
              xresult:=SQRT(argument)
          ELSE
            set_error(
             'extraneous argument supplied to function "'+
             function_name+'"')
        END;
      sqrt_function:=xresult
    END;

{ ------------------------------------------------------------------------ }

  FUNCTION simple_expression : REAL; FORWARD;

{ ------------------------------------------------------------------------ }

  FUNCTION funct : REAL;
    VAR
      argument                  : REAL;
      argument_stack_head       : argument_record_ptr;
      argument_stack_ptr        : argument_record_ptr;
      arguments_okay            : BOOLEAN;
      function_name             : string_255;
      non_alphanumeric_found    : BOOLEAN;
      xresult                   : REAL;	{ 8/11/95 dfn: result -> xresult }
      right_parenthesis_found   : BOOLEAN;
      tem_char                  : CHAR;
    BEGIN    
      result:=0;
      xresult:=0.0;
      non_alphanumeric_found:=FALSE;
      function_name:='';
      WHILE((expression_index <= expression_length)
      AND   (NOT non_alphanumeric_found)) DO
        BEGIN
          tem_char:=expression[expression_index];
          tem_char:=UPCASE(tem_char);
          IF ((tem_char >= 'A') AND (tem_char <= 'Z')) THEN
            BEGIN
              function_name:=function_name+tem_char;
              expression_index:=expression_index+1
            END
          ELSE
            non_alphanumeric_found:=TRUE
        END;
      argument_stack_head:=NIL;
      arguments_okay:=TRUE;
      eat_leading_spaces;
      IF expression_index <= expression_length THEN
        BEGIN
          tem_char:=expression[expression_index];
          IF tem_char = '(' THEN
            BEGIN
              expression_index:=expression_index+1;
              right_parenthesis_found:=FALSE;
              WHILE ((NOT right_parenthesis_found)
              AND    (arguments_okay)
              AND    (expression_index <= expression_length)) DO
                BEGIN
                  argument:=simple_expression;
                  IF error_detected THEN
                    arguments_okay:=FALSE
                  ELSE
                    BEGIN
                      IF argument_stack_head = NIL THEN
                        BEGIN
                          NEW(argument_stack_head);
                          argument_stack_head^.value:=argument;
                          argument_stack_head^.next_ptr:=NIL
                        END
                      ELSE
                        BEGIN
                          NEW(argument_stack_ptr);
                          argument_stack_ptr^.value:=argument;
                          argument_stack_ptr^.next_ptr
                           :=argument_stack_head;
                          argument_stack_head:=argument_stack_ptr
                        END;
                      eat_leading_spaces;
                      IF expression_index <= expression_length THEN
                        BEGIN
                          tem_char:=expression[expression_index];
                          IF tem_char = ')' THEN
                            BEGIN
                              right_parenthesis_found:=TRUE;
                              expression_index:=expression_index+1
                            END
                          ELSE
                            IF tem_char = ',' THEN
                              expression_index:=expression_index+1
                            ELSE
                              BEGIN
                                arguments_okay:=FALSE;
                                set_error(
                            'comma missing from function arguments')
                              END
                        END
                    END
                END;
              IF arguments_okay THEN
                BEGIN
                  IF (NOT right_parenthesis_found) THEN
                    BEGIN
                      arguments_okay:=FALSE;
                      set_error(
                   '")" to terminate function arguments is missing')
                    END
                END
            END
        END;
      IF arguments_okay THEN
        BEGIN
          IF function_name = 'ABS' THEN
            xresult
             :=abs_function(argument_stack_head,function_name) 
          ELSE
            IF function_name = 'ARCTAN' THEN
              xresult
               :=arctan_function(argument_stack_head,function_name)
            ELSE
              IF function_name = 'COS' THEN
                xresult
                 :=cos_function(argument_stack_head,function_name)
              ELSE
                IF function_name = 'EXP' THEN
                  xresult
                   :=exp_function(argument_stack_head,function_name)
                ELSE
                  IF function_name = 'LN' THEN
                    xresult
                     :=ln_function(argument_stack_head,function_name)
                  ELSE
                    IF function_name = 'PI' THEN
                      xresult
                       :=pi_function(argument_stack_head,function_name)
                    ELSE
                      IF function_name = 'SIN' THEN
                        xresult
                         :=sin_function(argument_stack_head,function_name)
                      ELSE
                        IF function_name = 'SQR' THEN
                          xresult
                           :=sqr_function(argument_stack_head,function_name)
                        ELSE
                          IF function_name = 'SQRT' THEN
                            xresult
                             :=sqrt_function(argument_stack_head,function_name)
                          ELSE
                            set_error('the function "'+
                             function_name+'" is unrecognized')
        END;
      WHILE (argument_stack_head <> NIL) DO
        BEGIN
          argument_stack_ptr:=argument_stack_head^.next_ptr;
          DISPOSE(argument_stack_head);
          argument_stack_head:=argument_stack_ptr
        END;
      funct:=result
    END;

{ ------------------------------------------------------------------------ }

  FUNCTION factor : REAL;
    VAR
      xresult                   : REAL;	{ 8/11/95 dfn: result -> xresult }
      tem_char                  : CHAR;
    BEGIN
      xresult:=0.0;
      eat_leading_spaces;
      IF expression_index > expression_length THEN
        set_error(
         'end of expression encountered where factor expected')
      ELSE
        BEGIN
          tem_char:=expression[expression_index];
          BEGIN
            IF tem_char = '(' THEN
              BEGIN
                expression_index:=expression_index+1;
                xresult:=simple_expression;
                IF (NOT error_detected) THEN
                  BEGIN
                    eat_leading_spaces;
                    IF expression_index > expression_length THEN
                      set_error(
                       'end of expression encountered '+
                       'where ")" was expected')
                    ELSE
                      IF expression[expression_index] = ')' THEN
                        expression_index:=expression_index+1
                      ELSE
                        set_error('expression not followed by ")"')
                  END
              END
            ELSE
              IF ((tem_char >= '0') AND (tem_char <= '9')) THEN
                xresult:=unsigned_number
              ELSE
                IF (((tem_char >= 'a') AND (tem_char <= 'z'))
                OR  ((tem_char >= 'A') AND (tem_char <= 'Z'))) THEN
                  xresult:=funct
                ELSE
                  set_error(
                   'function, unsigned number, or "(" expected')
          END
        END;
      factor:=xresult
    END;

{ ------------------------------------------------------------------------ }

  FUNCTION quotient_of_factors(VAR left_value,right_value : REAL) : REAL;
    VAR
      xresult                   : REAL; { 8/11/95 dfn: result -> xresult }
      tem_real                  : REAL;
    BEGIN
      xresult:=0.0;
      IF right_value = 0.0 THEN
        set_error('division by zero attempted')
      ELSE
        BEGIN
          IF left_value = 0.0 THEN
            xresult:=0.0
          ELSE
            BEGIN
              tem_real:=(LN(ABS(left_value))-LN(ABS(right_value)))/LN(10.0);
              IF tem_real < -37.0 THEN 
                xresult:=0.0
              ELSE
                IF tem_real > 37.0 THEN
                  set_error(
                   'overflow detected during division')
                ELSE
                  xresult:=left_value/right_value
            END
        END;
      quotient_of_factors:=xresult
    END;

{ ------------------------------------------------------------------------ }

  FUNCTION product_of_factors(VAR left_value,right_value : REAL) : REAL;
    VAR
      xresult                   : REAL; { 8/11/95 dfn: result -> xresult }
      tem_real                  : REAL;
    BEGIN
      xresult:=0.0;
      IF ((left_value <> 0.0) AND (right_value <> 0.0)) THEN
        BEGIN
          tem_real:=(LN(ABS(left_value))+LN(ABS(right_value)))/LN(10.0); 
          IF tem_real < -37.0 THEN
            xresult:=0.0
          ELSE
            IF tem_real > 37.0 THEN
              set_error(
               'overflow detected during multiplication')
            ELSE
              xresult:=left_value*right_value
        END;
      product_of_factors:=xresult
    END;

{ ------------------------------------------------------------------------ }

  FUNCTION factor_operator : string_1;
    VAR
      xresult                   : string_1; { 8/11/95 dfn: result -> xresult }
    BEGIN
      eat_leading_spaces;
      IF expression_index <= expression_length THEN
        BEGIN
          xresult:=expression[expression_index];
          IF ((xresult = '*')
          OR  (xresult = '/')) THEN
            expression_index:=expression_index+1
        END
      ELSE
        xresult:='';
      factor_operator:=xresult
    END;

{ ------------------------------------------------------------------------ }

  FUNCTION term : REAL;
    VAR
      operator                  : string_1;
      operator_found            : BOOLEAN;
      xresult                   : REAL;	{ 8/11/95 dfn: result -> xresult }
      right_value               : REAL;
    BEGIN
      xresult:=0;
      eat_leading_spaces;
      IF expression_index > expression_length THEN
        set_error(
         'end of expression encountered where term was expected')
      ELSE
        BEGIN
          xresult:=factor;
          operator_found:=TRUE;
          WHILE((NOT error_detected)
          AND   (operator_found)) DO
            BEGIN
              operator:=factor_operator;
              IF LENGTH(operator) = 0 THEN
                operator_found:=FALSE
              ELSE
                IF ((operator <> '*')
                AND (operator <> '/')) THEN
                  operator_found:=FALSE
                ELSE
                  BEGIN
                    right_value:=factor;
                    IF (NOT error_detected) THEN
                      BEGIN
                        IF operator = '*' THEN
                            xresult:=product_of_factors(
                             xresult,right_value)
                        ELSE
                            xresult:=quotient_of_factors(
                             xresult,right_value)
                      END
                  END
            END
        END;
      term:=xresult
    END;

{ ------------------------------------------------------------------------ }

  FUNCTION sum_of_terms(VAR left_value,right_value : REAL) : REAL;
    VAR
      xresult                    : REAL;	{ 8/11/95 dfn: result -> xresult }
    BEGIN
      xresult:=0.0;
      IF ((left_value > 0.0) AND (right_value > 0.0)) THEN
        IF left_value > (1.0E37 - right_value) THEN
          set_error('overflow detected during addition')
        ELSE
          xresult:=left_value+right_value
      ELSE
        IF ((left_value < 0.0) AND (right_value < 0.0)) THEN
          IF left_value < (-1.0E37 - right_value) THEN
            set_error('overflow detected during addition')
          ELSE
            xresult:=left_value+right_value
        ELSE
          xresult:=left_value+right_value;
      sum_of_terms:=xresult
    END;

{ ------------------------------------------------------------------------ }

  FUNCTION difference_of_terms(VAR left_value,right_value : REAL) : REAL;
    VAR
      xresult                    : REAL;	{ 8/11/95 dfn: result -> xresult }
    BEGIN
      xresult:=0;
      IF ((left_value < 0.0) AND (right_value > 0.0)) THEN
        IF left_value < (right_value - 1.0E37) THEN
          set_error('overflow detected during subtraction')
        ELSE
          xresult:=left_value-right_value
      ELSE
        IF ((left_value > 0.0) AND (right_value < 0.0)) THEN
          IF left_value > (right_value + 1.0E37) THEN
            set_error('overflow detected during subtraction')
          ELSE
            xresult:=left_value-right_value
        ELSE
          xresult:=left_value-right_value;
      difference_of_terms:=xresult
    END;

{ ------------------------------------------------------------------------ }

  FUNCTION term_operator : string_1;
    VAR
      xresult                    : string_1;	{ 8/11/95 dfn: result -> xresult }
    BEGIN
      eat_leading_spaces;
      IF expression_index <= expression_length THEN
        BEGIN
          xresult:=expression[expression_index];
          IF ((xresult = '+')
          OR  (xresult = '-')) THEN
            expression_index:=expression_index+1
        END
      ELSE
        xresult:='';
      term_operator:=xresult
    END;

{ ------------------------------------------------------------------------ }

  FUNCTION simple_expression;
    VAR
      leading_sign              : CHAR;
      operator                  : string_1;
      operator_found            : BOOLEAN;
      xresult                   : REAL;	{ 8/11/95 dfn: result -> xresult }
      right_value               : REAL;
      tem_char                  : CHAR;
    BEGIN
      xresult:=0.0;
      eat_leading_spaces;
      IF expression_index > expression_length THEN
        set_error(
       'end of expression encountered where simple expression expected')
      ELSE
        BEGIN
          leading_sign:=' ';
          tem_char:=expression[expression_index];
          IF ((tem_char = '+') OR (tem_char = '-')) THEN
            BEGIN
              leading_sign:=tem_char;
              expression_index:=expression_index+1
            END;
          xresult:=term;
          IF (NOT error_detected) THEN
            BEGIN
              IF leading_sign <> ' ' THEN
                BEGIN
                  IF leading_sign = '-' THEN
                    xresult:=-xresult
                END;
              operator_found:=TRUE;
              WHILE((NOT error_detected)
              AND   (operator_found)) DO
                BEGIN
                  operator:=term_operator;
                  IF LENGTH(operator) = 0 THEN
                    operator_found:=FALSE
                  ELSE
                    IF ((operator <> '+')
                    AND (operator <> '-')) THEN
                      operator_found:=FALSE
                    ELSE
                      BEGIN
                        right_value:=term;
                        IF (NOT error_detected) THEN
                          BEGIN
                            IF operator = '+' THEN
                              xresult:=sum_of_terms(
                               xresult,right_value)
                            ELSE
                              xresult:=difference_of_terms(
                               xresult,right_value)
                          END
                      END
                END
            END
        END;
      simple_expression:=xresult
    END;

{ ------------------------------------------------------------------------ }

  PROCEDURE output_value(VAR xresult : REAL);

  { this procedure used to send text directly to the display.
    I reworked it to condition the value only and then return. }

    VAR
      digits_in_integer_part       : INTEGER;
      magnitude_of_xresult          : REAL;

    BEGIN

      IF xresult >= 0.0 THEN
        magnitude_of_xresult:=xresult
      ELSE
        magnitude_of_xresult:=-xresult;
      IF magnitude_of_xresult >= 5.0E-3 THEN
        BEGIN
          digits_in_integer_part:=0;
          WHILE ((digits_in_integer_part <= 8)
          AND    (magnitude_of_xresult >= 1.0)) DO
            BEGIN
              magnitude_of_xresult:=magnitude_of_xresult/10.0;
              digits_in_integer_part:=digits_in_integer_part+1
            END;
(*
          IF digits_in_integer_part > 8 THEN
            WRITELN(OUTPUT,xresult:13)
          ELSE
            WRITELN(OUTPUT,xresult:10:8-digits_in_integer_part)
*)
        END;
(*
      ELSE
        WRITELN(OUTPUT,xresult:13)
*)
    END;

{ ------------------------------------------------------------------------ }

  PROCEDURE output_error(error_msg : string_255;
                         VAR expression : string_255;
                         VAR expression_index : INTEGER);

    { this routine used to write the expression, the position of
      the error, and an error message to the screen. it has been
      reworked to keep the position of the error only. if more
      information is required, add the code here. the original
      calling convention has been preserved.
    }

    BEGIN

      {trap the error here to see in Turbo Debugger}

      CalcError := expression_index;

    END;

{ ------------------------------------------------------------------------ }

procedure RawCalculate(MyFormula:string;var MyResult:real;var MyError:byte);

{ this procedure will evaluate an expression without variables.
  it is called by the Calculate procedure once variable values
  have been inserted into the expression.

  MyError will be 0 for a successful evaluation.
}

begin

  expression := MyFormula;
  MyResult := 0;
  CalcError := 0;
  expression_length := length(MyFormula);

  { ---- Original code starts here ---- }

  error_detected:=FALSE;
  expression_index:=1;
  xresult:=simple_expression;

  IF error_detected THEN
    output_error(error_msg,expression,expression_index)
  ELSE
    BEGIN
      eat_leading_spaces;
      IF expression_index <= expression_length THEN
        output_error('Error:  expression followed by garbage',
                     expression,expression_index)
      ELSE
        output_value(xresult);
    END;

  { ---- Original code ends here ---- }

  MyResult := xresult;
  MyError := CalcError;

end; {RawCalc}

{ ------------------------------------------------------------------------ }

procedure GetPointerTo(VariableID:str20;var MPtr:VariablePtr);

var

  Done : boolean;
  XPtr : VariablePtr;

begin

  MPtr := nil;
  XPtr := HPtr;

  Done := false;
  while (not Done) do begin

    if XPtr^.ID=VariableID then
      MPtr := XPtr;

    if XPtr^.Next=nil then
      Done := true
    else
      XPtr := XPtr^.Next;

  end; {while}

end; {GetPointerTo}

{ ------------------------------------------------------------------------ }

procedure ReadVariable(VariableID:str20;var MyValue:real;var MyError:boolean);

var

  MPtr : VariablePtr;

begin

  MyError := false;
  MyValue := 0;

  GetPointerTo(VariableID,MPtr);

  if MPtr<>nil then begin
    MyValue := MPtr^.Value
  end
  else begin
    MyError := true;
  end;

end; {ReadVariable}

{ ------------------------------------------------------------------------ }

procedure StoreVariable(VariableID:str20;MyValue:real);

var

  WorkingRec : VariableType;

begin

  fillchar(WorkingRec,sizeof(WorkingRec),0);
  WorkingRec.ID := VariableID;
  WorkingRec.Value := MyValue;

  If HPtr = nil then begin

    {this is the first record added to the list}

    New(HPtr);                                {allocate 1st record in LL }
    TPtr := HPtr;                             {init tail (= head)        }
    TPtr^ := WorkingRec;                      {add new record as head    }
    TPtr^.Next := nil;                        {set the next link for tail}

  end
  else begin

    GetPointerTo(VariableID,SPtr);

    if SPtr <> nil then begin

      {the list exists and so does the variable -- modify value}

      SPtr^.Value := MyValue;

    end
    else begin

      {the list exists, but the variable doesn't -- add it}

      New(SPtr);                          {allocate new record for LL }
      SPtr^ := WorkingRec;                {put info in new LL record  }
      TPtr^.Next := SPtr;                 {add new record as tail     }
      SPtr^.Next := nil;                  {set the new link for tail  }
      TPtr := SPtr;                       {point tail to new record   }

    end; {if-else}

  end;

end; {StoreVariable}

{ ------------------------------------------------------------------------- }

Procedure DestroyFieldList(TempPtr:VariablePtr);

{ This procedure recursively destroys a linked list }

Begin

  If TempPtr^.Next <> nil then
    DestroyFieldList(TempPtr^.Next);

  Dispose(TempPtr);

End;

{ ------------------------------------------------------------------------ }

procedure DestroyList;

begin

  if HPtr <> Nil then
    DestroyFieldList(HPtr);

  HPtr := nil;
  TPtr := nil;
  SPtr := nil;

end; {DestroyList}

{ ------------------------------------------------------------------------ }

procedure Calculate(MyFormula:string;var MyResult:real;var MyError:byte);

{ this procedure will evaluate an expression containing variables.
  this routine will scan the expression for variables, removing
  the variable IDs and substituting the value into the expression.
  once all variable IDs have been removed, this procedure calls
  RawCalculate for expression evaluation.

  MyError will be 0 for a successful evaluation.
}

var

  VarStr,
  DestStr : string;
  Index   : byte;
  MyReal  : real;
  MyErr   : boolean;

begin

  {the first part of this routine is the preprocessor for variables.
   the formula string will be copied to another string. as the string
   is copied, values for any variables will be inserted where the
   variable ID was in the original string.}

  MyError := 0;
  DestStr := '';
  Index := 1;

  while Index <= length(MyFormula) do begin

    if MyFormula[Index]='@' then begin

      VarStr := '@';
      inc(Index);
      while (MyFormula[Index]<>'@') AND (Index<=length(MyFormula)) do begin
        VarStr := VarStr + MyFormula[Index];
        inc(Index);
      end; {while}
      VarStr := VarStr + '@';

      if VarStr[length(VarStr)]='@' then begin
        {read variable}
        ReadVariable(VarStr,MyReal,MyErr);
        if not MyErr then begin
          {substitute value for variable}
          str(MyReal,VarStr);
          DestStr := DestStr + VarStr;
        end
        else
          {didn't find variable}
          MyError := Index - length(VarStr);
      end
      else begin
        {ran out of formula!}
        MyError := Index - length(VarStr);
      end; {if-else}

    end
    else
      DestStr := DestStr + MyFormula[Index];

    inc(Index);

  end; {while}

  if MyError=0 then begin
    MyFormula := DestStr;
    {call RawCalculate to evaluate expression}
    RawCalculate(MyFormula,MyResult,MyError);
  end;

end; {Calc}

{ ------------------------------------------------------------------------ }

procedure CalcAndStore(MyFormula:string;StoreID:str20;var MyError:byte);

{ this routine will evaluate an expression containing variables
  and will store the xresult in the variable with the ID, StoreID.
  this routine calls Calculate to evaluate the expression.

  MyError will be 0 for a successful evaluation.
}

var

  MyResult : real;

begin

  {call Calculate to evaluate expression}
  Calculate(MyFormula,MyResult,MyError);

  if MyError=0 then
    StoreVariable(StoreID,MyResult);

end; {CalcAndStore}

{ ------------------------------------------------------------------------ }

(* This is the original main program block, now unused. --- DJF

BEGIN
    REPEAT
      WRITELN(OUTPUT,' ');
      WRITE(OUTPUT,'Expression (RETURN to exit)?  ');
      READLN(INPUT,expression);
      expression_length:=LENGTH(expression);
      IF expression_length > 0 THEN
        BEGIN
          error_detected:=FALSE;
          expression_index:=1;
          xresult:=simple_expression;
          IF error_detected THEN
            output_error(error_msg,expression,expression_index)
          ELSE
            BEGIN
              eat_leading_spaces;
              IF expression_index <= expression_length THEN
                output_error(
                 'Error:  expression followed by garbage',
                 expression,expression_index)
              ELSE
                output_value(xresult)
            END
        END
    UNTIL (expression_length = 0)
  END.

  *)

{ ------------------------------------------------------------------------ }

Begin  {init code}

  {set up linked list to empty state}

  HPtr := nil;
  TPtr := nil;
  SPtr := nil;

  CalcError := 0;

End.

