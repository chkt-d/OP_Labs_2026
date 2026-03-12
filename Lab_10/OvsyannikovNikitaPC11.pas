PROGRAM FormatCorrection(INPUT, OUTPUT);
VAR
  Ch4, E, L: CHAR;
BEGIN
  READ(L);
  WHILE (L = ' ') 
  DO
    READ(L);
  WRITE(L);
  WHILE (Ch4 <> 'N') AND (NOT EOLN)
  DO
    BEGIN
      READ(INPUT, Ch4);
      WRITE(OUTPUT, Ch4)
    END;
  WRITELN;
  WRITE('  ');
  IF NOT EOLN
  THEN
    BEGIN
      READ(Ch4);
      WHILE Ch4 = ' '
      DO
        READ(Ch4);
    END;
  IF Ch4 <> 'E'
  THEN
    E := 'N'
  ELSE
    E := 'Y';
  WHILE (E = 'N') AND (NOT EOLN) 
  DO
    BEGIN
      WRITE(Ch4);
      L := Ch4;
      READ(Ch4);
      WHILE Ch4 = ' '
      DO
        READ(Ch4);
      IF (L = ';') OR (L = 'D') OR (L = 'N') OR (L = 'E')
      THEN
        IF Ch4 = 'E'
        THEN
          E := 'Y'
        ELSE
          IF (Ch4 = 'W') OR (Ch4 = 'R') OR ((Ch4 = ';') AND (L  = ';'))
          THEN
            BEGIN
              WRITELN;
              WRITE('  ')
            END;
      IF Ch4 = '('
      THEN
        BEGIN
          WRITE('(');
          WHILE (Ch4 <> ')') AND (NOT EOLN(INPUT))
          DO
            BEGIN
              READ(Ch4);
              WHILE Ch4 = ' '
              DO
                READ(Ch4);
              IF Ch4 = ','
              THEN
                BEGIN
                  WRITE(', ');
                  READ(Ch4);
                  WHILE Ch4 = ' '
                  DO
                    READ(Ch4)
                END;
              WRITE(Ch4)
            END;
          IF Ch4 = ')'
          THEN
            BEGIN
              READ(Ch4);
              WHILE Ch4 = ' '
              DO
                READ(Ch4);
              IF Ch4 <> ';'
              THEN
                E := 'Y'
              ELSE
                BEGIN
                  READ(Ch4);
                  WHILE Ch4 = ' '
                  DO
                    READ(Ch4);
                  IF Ch4 = 'E'
                  THEN
                    E := 'Y'
                  ELSE
                    BEGIN
                      WRITE(';');
                      WRITELN;
                      WRITE('  ')
                    END 
                END
            END    
        END
    END;
  WRITELN;
  IF E = 'Y'
  THEN
    WRITELN('END.')
END.
