# GitPush Function for PowerShell
# Add this function to your PowerShell profile or run it in your session

function gitpush {
    Write-Host "🚀 Starting GitPush process..." -ForegroundColor Green

    # Check if we're in a git repository
    if (-not (Test-Path ".git")) {
        Write-Host "❌ Error: Not in a git repository!" -ForegroundColor Red
        return
    }

    # Stage all changes
    Write-Host "📦 Staging all changes..." -ForegroundColor Yellow
    git add .

    # Check if there are any changes to commit
    $status = git status --porcelain
    if ([string]::IsNullOrEmpty($status)) {
        Write-Host "ℹ️  No changes to commit." -ForegroundColor Blue
        return
    }

    # Get current branch name
    $branch = git branch --show-current

    # Generate commit message based on changed files
    Write-Host "📝 Generating commit message..." -ForegroundColor Yellow

    # Get list of changed files
    $changedFiles = git diff --cached --name-only
    $fileCount = ($changedFiles | Measure-Object).Count

    # Analyze changes to create meaningful commit message
    $commitMessage = ""

    if ($fileCount -eq 1) {
        $file = $changedFiles[0]
        $fileName = Split-Path $file -Leaf
        $extension = [System.IO.Path]::GetExtension($file)
        
        switch ($extension) {
            ".html" { $commitMessage = "Update HTML content in $fileName" }
            ".css" { $commitMessage = "Update styling in $fileName" }
            ".js" { $commitMessage = "Update JavaScript functionality in $fileName" }
            ".py" { $commitMessage = "Update Python code in $fileName" }
            ".json" { $commitMessage = "Update configuration in $fileName" }
            ".md" { $commitMessage = "Update documentation in $fileName" }
            default { $commitMessage = "Update $fileName" }
        }
    } elseif ($fileCount -le 5) {
        # For small number of files, be more specific
        $extensions = $changedFiles | ForEach-Object { [System.IO.Path]::GetExtension($_) } | Sort-Object -Unique
        
        if ($extensions.Count -eq 1) {
            switch ($extensions[0]) {
                ".html" { $commitMessage = "Update HTML files ($fileCount files)" }
                ".css" { $commitMessage = "Update stylesheets ($fileCount files)" }
                ".js" { $commitMessage = "Update JavaScript files ($fileCount files)" }
                ".py" { $commitMessage = "Update Python files ($fileCount files)" }
                ".json" { $commitMessage = "Update configuration files ($fileCount files)" }
                ".md" { $commitMessage = "Update documentation ($fileCount files)" }
                default { $commitMessage = "Update $fileCount files" }
            }
        } else {
            $commitMessage = "Update multiple files: " + ($changedFiles | ForEach-Object { Split-Path $_ -Leaf } | Join-String -Separator ", ")
        }
    } else {
        # For many files, use a general message
        $commitMessage = "Update $fileCount files across the project"
    }

    # Add timestamp for uniqueness
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm"
    $commitMessage += " - $timestamp"

    Write-Host "💬 Commit message: $commitMessage" -ForegroundColor Cyan

    # Commit changes
    Write-Host "✅ Committing changes..." -ForegroundColor Yellow
    git commit -m "$commitMessage"

    if ($LASTEXITCODE -ne 0) {
        Write-Host "❌ Error: Failed to commit changes!" -ForegroundColor Red
        return
    }

    # Push changes
    Write-Host "🌐 Pushing to remote repository..." -ForegroundColor Yellow
    git push

    if ($LASTEXITCODE -eq 0) {
        Write-Host "🎉 GitPush completed successfully!" -ForegroundColor Green
        Write-Host "   Branch: $branch" -ForegroundColor Gray
        Write-Host "   Files: $fileCount changed" -ForegroundColor Gray
    } else {
        Write-Host "❌ Error: Failed to push changes!" -ForegroundColor Red
    }
}

# Usage: Just type 'gitpush' in your PowerShell terminal
Write-Host "✅ GitPush function loaded! Type 'gitpush' to use it." -ForegroundColor Green