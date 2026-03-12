PROGRAM DeleteUnnesseserySpaces(INPUT, OUTPUT);
VAR
  Ch: CHAR;
BEGIN
  Ch := ' '; 
  WHILE (Ch = ' ') AND (NOT EOLN)
  DO
    READ(Ch);
  IF EOLN AND (Ch <> ' ')
  THEN
    WRITE(Ch)
  ELSE
    WHILE NOT EOLN
    DO
      BEGIN
        IF Ch = ' '
        THEN
          BEGIN
            WHILE (NOT EOLN) AND (Ch = ' ')
            DO
              READ(Ch);
            IF NOT EOLN
            THEN
              BEGIN
                WRITE(' ', Ch);
                READ(Ch)
              END
          END
        ELSE
          BEGIN
            WRITE(Ch);
            READ(Ch);
            IF (Ch <> ' ') AND (EOLN)
            THEN
              WRITE(Ch)
          END
      END;       
  WRITELN('#')
END.
