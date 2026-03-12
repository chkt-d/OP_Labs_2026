PROGRAM BubbleSortWProcedures(INPUT, OUTPUT);
VAR
  Sorted, Ch, Ch1, Ch2: CHAR;
  F1, F2: TEXT;
PROCEDURE CopyFile(VAR InFile, OutFile: TEXT);
BEGIN
  WHILE NOT EOLN(InFile)
  DO
    BEGIN
      READ(InFile, Ch);
      WRITE(OutFile, Ch)
    END;
  WRITELN(OutFile)
END;
BEGIN
  REWRITE(F1);
  CopyFile(INPUT, F1);
  RESET(F1);
  Sorted := 'N';
  WHILE Sorted = 'N'
  DO
    BEGIN
      Sorted := 'Y';
      RESET(F1);
      REWRITE(F2);
      IF NOT EOLN(F1)
      THEN
        READ(F1, Ch1);
        WHILE NOT EOLN(F1)
        DO
          BEGIN
            READ(F1, Ch2);
            IF Ch2 < Ch1
            THEN
              BEGIN
                Sorted := 'N';
                WRITE(F2, Ch2)
              END
            ELSE
              BEGIN
                WRITE(F2, Ch1);
                Ch1 := Ch2
              END
          END;
        WRITELN(F2, Ch1);
        RESET(F2);
        REWRITE(F1);
        CopyFile(F2, F1)
    END;
  RESET(F1);
  CopyFile(F1, OUTPUT)
END.
