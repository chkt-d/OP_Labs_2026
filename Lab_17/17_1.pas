PROGRAM SumOfString(INPUT, OUTPUT);
VAR
  Sum, Digit: INTEGER;
  Overflow: Boolean;

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

BEGIN {SumOfString}
  Sum := 0;
  Digit := 0;
  WHILE (NOT EOLN) AND (Digit <> -1) AND (NOT Overflow)
  DO
    BEGIN
      ReadDigit(INPUT, Digit);
      Overflow := (Sum > (MAXINT - Digit));
      IF (NOT Overflow) AND (Digit <> -1)
        THEN
          Sum := Sum + Digit
    END;
  IF NOT Overflow
  THEN
    WRITELN(Sum)
  ELSE
    WRITELN('Overflow!')
END. {SumOfString}
