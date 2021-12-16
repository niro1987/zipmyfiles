@ECHO OFF
CLS

:Initialize
    @REM Iterate over all files in the current folder
    ECHO:

    SET "_ME=%~f0"
    SET "_7z=C:\Program Files\7-Zip\7z.exe"

    IF NOT EXIST "%_7z%" (
        ECHO "You do not have 7-Zip installed."
        GOTO :Terminate
    )

    FOR /r %%i IN (*) DO CALL :zipmyfile %%~fi

    ECHO Done!
    GOTO :Terminate

:zipmyfile

    SET "_FILEPATH=%*"

    IF /I NOT "%_ME%"=="%_FILEPATH%" (
        IF /I NOT "%_FILEPATH:~-3%"=="zip" (
            ECHO "%_FILEPATH%.zip"
            "%_7z%" a -mx5 -tzip -sse -aoa -sdel "%_FILEPATH%.zip" "%_FILEPATH%"
        )
    )

    GOTO :EOF

:Terminate
    PAUSE
