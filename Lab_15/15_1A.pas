PROGRAM CountInput(INPUT, OUTPUT);
USES
  Count3;
VAR
  Ch, X100, X10, X1: CHAR;
BEGIN
  Start;
  WHILE NOT EOLN
  DO
    BEGIN
      READ(INPUT, Ch);
      Bump
    END;
  Value(X100, X10, X1);
  IF (X100 = '9') AND (X10 = '9') AND (X1 = '9')
  THEN
    WRITELN('В строке как минимум 999 символов')
  ELSE
    WRITELN('В строке ', X100, X10, X1, ' символов')
END.
  

