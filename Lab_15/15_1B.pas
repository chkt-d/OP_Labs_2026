PROGRAM CountInput(INPUT, OUTPUT);
USES
  Count3;

VAR
  Ch1, Ch2, Ch3, X100, X10, X1, Flag: CHAR;

BEGIN
  Start; 
  Flag := '0';
  WHILE NOT EOLN
  DO
    BEGIN
      Ch1 := Ch2;
      Ch2 := Ch3;
      READ(Ch3);
      IF Flag = '0'
      THEN
        Flag := '1'
      ELSE
        IF Flag = '1'
        THEN 
          Flag := 'Y';
      IF ((Ch2 < Ch1) AND (Ch2 < Ch3)) OR ((Ch2 > Ch1) AND (Ch2 > Ch3))
      THEN
        IF Flag = 'Y'
        THEN
          Bump; 
    END;

  Value(X100, X10, X1);
  IF (X100 = '9') AND (X10 = '9') AND (X1 = '9')
  THEN
    WRITELN('В строке как минимум 999 реверсов')
  ELSE
    WRITELN('В строке ', X100, X10, X1, ' реверсов')
END.
  
