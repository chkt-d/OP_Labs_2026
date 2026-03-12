PROGRAM FindNumber(INPUT, OUTPUT);
VAR
  Number: INTEGER;

PROCEDURE ReadDigit(VAR F:TEXT; VAR D: INTEGER);
{Считывает текущий символ из файла. Если он - цифра, возвращает его 
 преобразуя в значение типа INTEGER. Если считанный символ не цифра
 возвращает -1}
VAR
  Ch: CHAR;
BEGIN {ReadDigit}
  READ(Ch);
  IF Ch = '0' THEN D := 0 ELSE
  IF Ch = '1' THEN D := 1 ELSE
  IF Ch = '2' THEN D := 2 ELSE
  IF Ch = '3' THEN D := 3 ELSE
  IF Ch = '4' THEN D := 4 ELSE
  IF Ch = '5' THEN D := 5 ELSE
  IF Ch = '6' THEN D := 6 ELSE
  IF Ch = '7' THEN D := 7 ELSE
  IF Ch = '8' THEN D := 8 ELSE
  IF Ch = '9' THEN D := 9 ELSE
  D := -1     
END; {ReadDigit}

PROCEDURE ReadNumber(VAR F:TEXT; VAR N: INTEGER);
{Преобразует строку цифр из файла до первого нецифрового символа,  
в соответствующее целое число N}
VAR
  Digit: INTEGER;
BEGIN {ReadNumber}
  ReadDigit(F, Digit);
  IF NOT (Digit = -1)
  THEN
    BEGIN
      N := Digit;
      WHILE (NOT EOLN) AND (Digit <> -1) AND (N <> -2)
      DO
        BEGIN
          ReadDigit(F, Digit);
          IF Digit <> -1
          THEN
            IF (N < (MAXINT DIV 10)) OR ((N = (MAXINT DIV 10)) AND (Digit <= (MAXINT MOD 10)))
            THEN
              N := (N*10) + Digit
            ELSE
              N := -2
        END;  
    END
  ELSE
    N := -1 
END; {ReadNumber}

BEGIN {FindNumber}
  WRITELN('MAXINT: "', MAXINT, '"');
  IF NOT EOLN
  THEN
    ReadNumber(INPUT, Number)
  ELSE
    Number := -1;
  IF Number = -1
  THEN
    WRITELN('The line does not start with numbers!')
   ELSE
     IF Number = -2
     THEN
       WRITELN('The number is too big!')
    ELSE
      WRITELN(Number)
END. {FindNumber}

