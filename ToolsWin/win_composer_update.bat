@echo off

call win_variables.bat

cd %projectRoot%

php %composerLocation% update

pause