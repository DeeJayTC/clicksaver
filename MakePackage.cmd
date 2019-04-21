echo off
set CONFIG=
if exist "Release\Clicksaver.exe" set CONFIG=Release
if exist "Debug\Clicksaver.exe" set CONFIG=Debug
if "%CONFIG%" == "" goto ERROR1

md CS240
copy %CONFIG%\ClickSaver.exe CS240\

copy LastSettings.cs CS240\

copy found.wav CS240\
copy notfound.wav CS240\

copy AOHook\AOHook.dll  CS240\

copy ctreestd.dll CS240\
copy libdb40.dll CS240\

copy gpl.txt CS240\
copy ReadMe.txt CS240\

echo ZipFolder "CS240.zip", "CS240" > _zipIt.vbs
type ZipFolder.vbs >> _zipIt.vbs
CScript _zipIt.vbs

del /Q CS240\*
del _zipIt.vbs
rd CS240

goto FINISH

:ERROR1

echo Clicksaver.exe not found.

:FINISH

echo Script done.
