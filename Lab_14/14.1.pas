PROGRAM Reverse(INPUT, OUTPUT);
  
PROCEDURE Reverse(VAR InFile, OutFile: TEXT);
VAR
  Ch: CHAR;
BEGIN
  IF NOT EOLN(InFile)
  THEN
    BEGIN
      READ(InFile, Ch);
      Reverse(InFile, OutFile);
      WRITE(OutFile, Ch)
    END
END;

BEGIN
  Reverse(INPUT, OUTPUT);
  WRITELN
END.
