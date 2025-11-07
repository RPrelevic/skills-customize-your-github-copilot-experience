@echo off
echo 🚀 Starting GitPush process...

REM Check if we're in a git repository
if not exist ".git" (
    echo ❌ Error: Not in a git repository!
    exit /b 1
)

REM Stage all changes
echo 📦 Staging all changes...
git add .

REM Check if there are any changes to commit
git diff --cached --quiet
if %errorlevel% equ 0 (
    echo ℹ️  No changes to commit.
    exit /b 0
)

REM Get current date and time for commit message
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
set "timestamp=%YYYY%-%MM%-%DD% %HH%:%Min%"

REM Generate commit message based on changed files
echo 📝 Generating commit message...

REM Count changed files
for /f %%i in ('git diff --cached --name-only ^| find /c /v ""') do set filecount=%%i

REM Create commit message
if %filecount% equ 1 (
    for /f "delims=" %%i in ('git diff --cached --name-only') do set "filename=%%~nxi"
    set "commitmsg=Update !filename!"
) else if %filecount% leq 5 (
    set "commitmsg=Update %filecount% files"
) else (
    set "commitmsg=Update %filecount% files across the project"
)

set "commitmsg=%commitmsg% - %timestamp%"
echo 💬 Commit message: %commitmsg%

REM Commit changes
echo ✅ Committing changes...
git commit -m "%commitmsg%"
if %errorlevel% neq 0 (
    echo ❌ Error: Failed to commit changes!
    exit /b 1
)

REM Push changes
echo 🌐 Pushing to remote repository...
git push
if %errorlevel% equ 0 (
    echo 🎉 GitPush completed successfully!
    for /f "delims=" %%i in ('git branch --show-current') do echo    Branch: %%i
    echo    Files: %filecount% changed
) else (
    echo ❌ Error: Failed to push changes!
    exit /b 1
)