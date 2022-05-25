@echo off

call win_variables.bat

cd %projectRoot%

php console.php update_stocks

pause