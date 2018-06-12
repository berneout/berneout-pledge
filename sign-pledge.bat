@if (@X)==(@Y) @end /* necessary for embedded JS
@echo off

:: Check if git is available
for /f "tokens=*" %%i in ('git 2^>^&1 1^>NUL') do (
	(
	echo You must have git installed to sign this pledge.
	echo https://git-scm.com/
	) 1>&2
	pause
	exit /B 1
)

set EDITION=
for /f "tokens=*" %%i in ('git tag -l --points-at HEAD 2^> nul') do set EDITION=%%i

if "%EDITION%"=="" (
	(
	echo This is not an official edition of The Berneout Pledge!  Please visit
	echo https://github.com/berneout/berneout-pledge for the latest edition!
	) 1>&2
	pause
	exit /B 1
)

set /p USER=Enter you GitHub user name, without @: 

echo.
echo ########################################################################
echo.

setlocal EnableDelayedExpansion
:: The 2 empty lines here are required to put \n in a variable
set LF=^


set PLEDGE=
for /f "tokens=1* delims=]" %%A in ('type "pledge" ^| find /n /v ""') do (
	set "LINE=%%B"
	if "!LINE:~0,7!"=="Signed:" (
		:: Remove last \n temporarily
		set "PLEDGE=!PLEDGE:~0,-1!"
		echo !PLEDGE!
		echo ########################################################################
		echo # To sign the pledge, type your name between slashes like /Casey Yao/. #
		echo # If you don't want to sign, press Control + C to exit.                #
		echo ########################################################################
		echo.
		:: Re-add the removed \n
		set "PLEDGE=!PLEDGE!!LF!"

		set /p SIGNATURE=Signed: 

		:: Use embedded Javascript to get the ISO-8106 timestamp
		for /f "tokens=*" %%i in ('cscript //E:jscript //nologo "%~f0" %*') do set TIMESTAMP=%%i
	)
	if "!LINE!" neq "" (
		set "LINE=!LINE:{{{PLEDGE}}}=The Berneout Pledge %EDITION%!"
		set "LINE=!LINE:{{{GITHUB_USER_NAME}}}=%USER%!"
		for /f "delims=" %%Z in ("!TIMESTAMP!") do set "LINE=!LINE:{{{TIMESTAMP}}}=%%Z!"
		for /f "delims=" %%Z in ("!SIGNATURE!") do set "LINE=!LINE:{{{SIGNATURE}}}=%%Z!"
	)
	set "PLEDGE=!PLEDGE!!LINE!!LF!"
)
:: Remove the duplicated trailing \n
set "PLEDGE=!PLEDGE:~0,-1!"

echo !PLEDGE!> pledge

echo.
call git add pledge
call git rm -f sign-pledge.sh
:: Delay the removal of the file, otherwise the script will stop execution
call git rm -f --cached sign-pledge.bat
call git rm -f README.md
call git commit -m "Customize for @%USER%"

echo.
echo You have signed The Berneout Pledge %EDITION%!
echo.
echo Two more steps to go:
echo.
echo 1. Create the repository github.com/%USER%/berneout-pledge.
echo.
echo 2. Push this Git repository there.
echo.
pause

del /f sign-pledge.bat
goto :eof
*/
function pad(number) {
  return number < 10 ? ('0' + number) : number;
}
var date = new Date();
var isoString = date.getUTCFullYear() +
	'-' + pad(date.getUTCMonth()+1) +
	'-' + pad(date.getUTCDate()) +
	'T' + pad(date.getUTCHours()) +
	':' + pad(date.getUTCMinutes()) +
	':' + pad(date.getUTCSeconds()) +
	'Z';
WScript.echo(isoString);
