PROGRAM RCopy(INPUT, OUTPUT);

PROCEDURE RCopy(VAR InFile, OutFile: TEXT);
VAR
  Ch: CHAR;
BEGIN
  IF NOT EOLN(InFile)
  THEN
    BEGIN
      READ(InFile, Ch);
      WRITE(OutFile, Ch);
      RCopy(InFile, OutFile)
    END
  ELSE
    WRITELN(InFile)
END;

BEGIN
  RCopy(INPUT, OUTPUT)
END.
