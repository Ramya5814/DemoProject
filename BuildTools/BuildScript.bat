echo ****** Build Script Batch file is called ******
Set VisualStudio2019Path=C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\MSBuild\Current\Bin\MSBuild.exe
echo VisualStudio2019Path - %VisualStudio2019Path%
Set BuildScriptPath=%CD%
echo BuildScriptPath - %BuildScriptPath%
cd.. 
Set DownloadPath=%CD%
echo DownloadPath - %DownloadPath%
cd %BuildScriptPath%
echo ****** Building in 2019 at %date% %time% ******
echo "%DownloadPath%\SampleApp.sln" - 2019
"%VisualStudio2019Path%" "%DownloadPath%\SampleApp.sln" /restore /p:AllowUnsafeBlocks=true;Configuration=Release;VisualStudioVersion=16.0 /verbosity:minimal /m
if ERRORLEVEL 1 GOTO VSERROR
cd %DownloadPath%
mkdir Artifacts
xcopy /y "%DownloadPath%\ConsoleApp2\bin\Release\ConsoleApp2.exe" "%DownloadPath%\Artifacts\"