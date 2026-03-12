PROGRAM CompareTwoLines(INPUT, OUTPUT);
VAR
  F1, F2: TEXT;
  Res, Ch: CHAR;

PROCEDURE Lexico(VAR F1, F2: TEXT; VAR Result: CHAR);
VAR
  Ch1, Ch2: CHAR;
BEGIN {Lexico}
  Result := '0';
  RESET(F1);
  RESET(F2);
  WHILE (NOT EOLN(F1) AND NOT EOLN(F2)) AND (Result = '0')
  DO
    BEGIN
      READ(F1, Ch1);
      READ(F2, Ch2);
      IF (Ch1 < Ch2)
      THEN {Ch1 < Ch2 или F1 короче F2}
        Result := '1';
      IF (Ch1 > Ch2)
      THEN {Ch1 > Ch2 или F2 короче F1}
        Result := '2'
    END;
  IF Result = '0'
  THEN
    IF NOT(EOLN(F1) AND EOLN(F2))
    THEN
      IF EOLN(F1)
      THEN
        Result := '1'
      ELSE
        Result := '2'
END; {Lexico}

BEGIN
  REWRITE(F1);
  REWRITE(F2);
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      READ(INPUT, Ch);
      WRITE(F1, Ch)
    END;
  WRITELN(F1);
  READLN(INPUT);
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      READ(INPUT, Ch);
      WRITE(F2, Ch)
    END;
  WRITELN(F2);
  Lexico(F1, F2, Res);
  WRITE(OUTPUT, 'F1 ');
  IF Res = '0'
  THEN
    WRITE('=');
  IF Res = '1'
  THEN
    WRITE('<');
  IF RES = '2'
  THEN
    WRITE('>');
  WRITELN(' F2')
END.


