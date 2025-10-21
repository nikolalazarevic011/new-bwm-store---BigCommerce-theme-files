@echo off
echo ========================================
echo BigCommerce Stencil Theme - Dev Server
echo ========================================
echo.

REM Switch to Node 20
echo Switching to Node 20...
call nvm use 20.11.1

REM Verify version
echo.
echo Current Node version:
node --version

REM Start Stencil
echo.
echo Starting Stencil development server...
echo Press Ctrl+C to stop the server
echo.
stencil start

pause
