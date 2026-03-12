PROGRAM Stat(INPUT, OUTPUT);
VAR
  Number, Min, Max, Sum, Count: INTEGER;
  OverFlowError: Boolean;

PROCEDURE ReadNumber(VAR F:TEXT; VAR N: INTEGER);
{Преобразует строку цифр из файла до первого нецифрового символа,  
в соответствующее целое число N}
VAR
  Digit: INTEGER;

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

PROCEDURE ReadSpaces(VAR F:TEXT);
VAR
  Ch: CHAR;
BEGIN
  READ(F, Ch);
  WHILE Ch = ' '
  DO
    READ(F, Ch);  
END;

BEGIN {Stat}
  Min := MAXINT;
  Max := 0;
  Sum := 0;
  Count := 0;
  Number := 0;
  IF NOT EOLN
  THEN
    WHILE (NOT OverFlowError) AND (NOT EOLN)
    DO
      BEGIN
        ReadNumber(INPUT, Number);
        IF Number >= 0
        THEN
          IF (Sum <= (MAXINT - Number)) AND (Count <> MAXINT)
          THEN
            BEGIN
              Sum := Sum + Number;
              Count := Count + 1;
              IF Number > Max
              THEN
                Max := Number;
              IF Number < Min
              THEN
                Min := Number
            END
          ELSE
            OverFlowError := True
        ELSE 
          IF Number = -2
          THEN
            OverFlowError := True
      END;
  IF OverFlowError
  THEN
    WRITELN('Overflow!')
  ELSE
    BEGIN
      WRITELN('Min: ', Min);     
      WRITELN('Max: ', Max);
      WRITELN('Average: ', (Sum DIV Count), '.', ((Sum MOD Count)*100 DIV Count) MOD 100))
    END  
END. {Stat}

