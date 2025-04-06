# setup.ps1 — Bootstrap WezTerm + Starship + Zebar

Write-Host "`n🚀 Installing your terminal dotfiles setup..." -ForegroundColor Cyan

# Clone the dotfiles repo if not already present
$repo = "$HOME\dotfiles"
if (-not (Test-Path $repo)) {
  git clone https://github.com/waterloo8675309/dotfiles.git $repo
}

# Create config directories
New-Item -Force -ItemType Directory "$HOME\.config\wezterm" | Out-Null
New-Item -Force -ItemType Directory "$HOME\.config" | Out-Null
New-Item -Force -ItemType Directory "$HOME\.glzr\zebar" | Out-Null

# Copy config files
Copy-Item "$repo\.config\wezterm\.wezterm.lua" "$HOME\.config\wezterm\" -Force
Copy-Item "$repo\.config\starship.toml" "$HOME\.config\" -Force
Copy-Item -Recurse "$repo\.glzr\zebar\*" "$HOME\.glzr\zebar\" -Force

# Install scoop if not present
if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
  Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
  Invoke-Expression (iwr -useb get.scoop.sh)
}

# Install Starship and Nerd Font
scoop install starship
scoop bucket add nerd-fonts
scoop install JetBrainsMono-NF

# Add Starship to PowerShell profile
$profile = "$HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
if (-not (Test-Path $profile)) {
  New-Item -ItemType File -Path $profile -Force
}
if (-not (Select-String -Path $profile -Pattern 'starship')) {
  Add-Content $profile "`nInvoke-Expression (&starship init powershell)"
}

# Launch Zebar if available
$zebarPath = "C:\Program Files\glzr.io\Zebar\zebar.exe"
if (Test-Path $zebarPath) {
  Start-Process $zebarPath
} else {
  Write-Host "⚠️ Zebar not found. Install it from https://github.com/zebar-go/zebar/releases" -ForegroundColor Yellow
}

Write-Host "`n✅ Setup complete. Restart WezTerm or your terminal to apply everything." -ForegroundColor Green
