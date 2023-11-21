@echo off
call git pull origin master
call git submodule init
call git submodule update 
call git submodule sync 
REM echo "Installing VIM Config files"
REM copy /Y .vimrc C:%HOMEPATH%\
REM xcopy .vim C:%HOMEPATH%\vimfiles /E /I /Y

echo "Installing NVIM Config files"
xcopy nvim %LOCALAPPDATA%\nvim /E /I /Y
