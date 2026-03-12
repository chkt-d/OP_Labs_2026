PROGRAM Split(INPUT, OUTPUT);
VAR
  Odds, Evens: TEXT;

PROCEDURE CopyOut(VAR F1: TEXT);
VAR
  Ch: CHAR;
BEGIN
  WHILE NOT EOLN(F1)
  DO
    BEGIN
      READ(F1, Ch);
      WRITE(OUTPUT, Ch)
    END;
  WRITELN(OUTPUT)
END;

PROCEDURE OddsEvens(VAR InFile, Odds, Evens: TEXT);
VAR
  Ch, Next: CHAR;
BEGIN
  REWRITE(Odds);
  REWRITE(Evens);
  Next := 'O';
  WHILE NOT EOF(InFile)
  DO
    BEGIN
      WHILE NOT EOLN
      DO
        BEGIN
          READ(InFile, Ch);
          IF Next = 'O'
          THEN
            BEGIN
              WRITE(Evens, Ch);
              Next := 'E'
            END
          ELSE
            BEGIN
              WRITE(Odds, Ch);
              Next := 'O'
            END
        END;
      READLN;
      WRITELN(Odds);
      WRITELN(Evens)
    END;
  WRITELN(Odds);
  WRITELN(Evens);
  RESET(Odds);
  RESET(Evens)
END;

BEGIN
  OddsEvens(INPUT, Odds, Evens);
  CopyOut(Odds);
  CopyOut(Evens);
  WRITELN
END.


