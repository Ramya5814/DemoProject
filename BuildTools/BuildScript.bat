@echo off
echo ****** Build Script Batch file is called ******
Set VisualStudio2019Path=C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\MSBuild\Current\Bin\MSBuild.exe
echo VisualStudio2019Path - %VisualStudio2019Path%
Set BuildScriptPath=%CD%
echo BuildScriptPath - %BuildScriptPath%
cd.. 
Set DownloadPath=%CD%
echo DownloadPath - %DownloadPath%
cd %BuildScriptPath%
echo.
echo ****** Set Local Variables ******
for /F "skip=1 delims=" %%F in ('
    wmic PATH Win32_LocalTime GET Day^,Month^,Year /FORMAT:TABLE
') do (
    for /F "tokens=1-3" %%L in ("%%F") do (
        set DD=0%%L
        set MM=0%%M
        set YY=%%N
    )
)
set DD=%DD:~-2%
set MM=%MM:~-2%

if %MM%==01 set MM=January
if %MM%==02 set MM=February
if %MM%==03 set MM=March
if %MM%==04 set MM=April
if %MM%==05 set MM=May
if %MM%==06 set MM=June
if %MM%==07 set MM=July
if %MM%==08 set MM=August
if %MM%==09 set MM=September
if %MM%==10 set MM=October
if %MM%==11 set MM=November
if %MM%==12 set MM=December
set NewDate=%MM% %YY%
echo NewDate - %NewDate%
set NewCopyright=2015 - %YY% Unisys Corporation
echo NewCopyright - %NewCopyright%
UpdateReadme "%DownloadPath%\Documentation\ReadmeVSIDE.htm" "7.0.%NewBuildNumber%.%NewRevisionNumber%" "%NewDate%" "%NewCopyright%"
echo ****** Building in 2019 at %date% %time% ******
echo "%DownloadPath%\SampleApp.sln" - 2019
"%VisualStudio2019Path%" "%DownloadPath%\SampleApp.sln" /restore /p:AllowUnsafeBlocks=true;Configuration=Release;VisualStudioVersion=16.0 /verbosity:minimal /m
if ERRORLEVEL 1 GOTO VSERROR
cd %DownloadPath%
mkdir Artifacts
xcopy /y "%DownloadPath%\ConsoleApp2\bin\Release\ConsoleApp2.exe" "%DownloadPath%\Artifacts\"
