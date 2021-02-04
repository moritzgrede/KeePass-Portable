@ECHO OFF
SET NAME=moritz
SET FamDB="%USERPROFILE%\family-local.kdbx"
SET PerDB="%USERPROFILE%\%NAME%-local.kdbx"
IF NOT EXIST %FamDB% (
    IF NOT EXIST %PerDB% (
        SET MSG="Die lokalen Tresoren sind nicht aufzufinden!"
        GOTO fileNotExistent
    )
)
IF NOT EXIST %FamDB% (
    SET MSG="Der family Tresor ist nicht aufzufinden!"
    GOTO fileNotExistent
) ELSE IF NOT EXIST %PerDB% (
    SET MSG="Der %NAME% Tresor ist nicht aufzufinden!"
    GOTO fileNotExistent
)
GOTO :eof
:fileNotExistent
ECHO %MSG%
ECHO Entweder Einrichtung vornehmen oder Fenster über das 'X' schließen
ECHO(
PAUSE
"%~dp0\..\Plugins/IOProtocolExt_WinSCP\WinSCP.exe" && EXIT