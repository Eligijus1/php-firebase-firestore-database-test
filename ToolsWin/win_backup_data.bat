@echo off

cls

REM Define required variables:
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
set "datestamp=%YYYY%%MM%%DD%" & set "timestamp=%HH%%Min%%Sec%"
set "fullstamp=%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%"
set "backup_directory=backup_eLygaDB2_test_data_%fullstamp%"
set backup_filename="%backup_directory%.zip"
set zip="C:\Program Files\7-Zip\7z.exe"

cd C:\Projects\eLygaDB2
mkdir %backup_directory%

REM /E - Copies directories and subdirectories, including empty ones.
REM /Q - Does not display file names while copying.
REM /Y - Suppresses prompting to confirm you want to overwrite an existing destination file.
REM xcopy /Y /Q var\app.db %backup_directory%
REM mkdir %backup_directory%\images
xcopy /E /Y /Q Data %backup_directory%\

%zip% a %backup_filename% %backup_directory%

rmdir /s /q %backup_directory%

pause