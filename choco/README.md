# Chocolatey

Scripts for bootstrapping a Windows developer machine using [Chocolatey](https://chocolatey.org) — the package manager for Windows.

## What is Chocolatey?

[Chocolatey](https://chocolatey.org) is the most popular package manager for Windows. It lets you install, update, and manage software from the command line — similar to `apt` on Ubuntu or `brew` on macOS. Packages are pulled from the [Chocolatey Community Repository](https://community.chocolatey.org/packages) or your own internal feed.

**Key concepts:**

| Term | What it means |
|---|---|
| `choco install <package> -y` | Install a package, auto-confirm all prompts |
| `choco upgrade <package>` | Upgrade a package to its latest version |
| `choco upgrade all` | Upgrade everything installed via Chocolatey |
| `choco uninstall <package>` | Remove a package |
| `choco list` | List installed packages |
| `choco search <name>` | Search the package repository |

> All Chocolatey commands must be run from an **elevated (Administrator) PowerShell session**.

---

## Folder Structure

```
choco/
├── README.md
├── install.ps1       # Chocolatey installer (bootstraps the package manager itself)
└── setup-env.ps1     # App installer (installs packages via Chocolatey)
```

---

## Getting Started

### Step 1 — Open an elevated PowerShell session

Right-click **Windows PowerShell** or **Windows Terminal** and choose **Run as Administrator**. All Chocolatey operations require admin rights.

### Step 2 — Allow script execution

Windows blocks unsigned scripts by default. Run this once to allow local scripts:

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Step 3 — Run the setup script

Navigate to this directory and run:

```powershell
.\setup-env.ps1
```

This will:
1. Run `install.ps1` to install Chocolatey itself (or update it if already present)
2. Install all apps across all categories (SYS, USER, DEV)

---

## Usage

### Install all apps (default)

```powershell
.\setup-env.ps1
```

### Install only a specific category

Use the `-Apps` parameter to install a subset:

```powershell
# System utilities only
.\setup-env.ps1 -Apps SYS

# Developer tools only
.\setup-env.ps1 -Apps DEV

# User / productivity apps only
.\setup-env.ps1 -Apps USER
```

| Value | What gets installed |
|---|---|
| `ALL` | Everything (default) |
| `SYS` | System utilities |
| `DEV` | Developer tools |
| `USER` | Browsers and productivity apps |

### Skip Chocolatey installation (if already installed)

```powershell
.\setup-env.ps1 -SkipChocolatey
```

---

## What Gets Installed

### System Apps (`SYS`)

| Package | Description |
|---|---|
| `curl` | HTTP client for the command line |
| `7zip.install` | File archiver (zip, 7z, tar, etc.) |

### Developer Apps (`DEV`)

| Package | Description |
|---|---|
| `git.install` | Version control |
| `nodejs.install` | JavaScript runtime (Node.js + npm) |
| `notepadplusplus.install` | Lightweight code/text editor |
| `sourcetree` | Git GUI client by Atlassian |
| `atom` | Hackable text editor by GitHub |
| `linqpad` | .NET scratch pad and query tool |

### User Apps (`USER`)

| Package | Description |
|---|---|
| `googlechrome` | Google's web browser |
| `firefox` | Mozilla Firefox browser |
| `adobereader` | PDF viewer |

---

## Useful Chocolatey Commands

```powershell
# See all installed packages
choco list

# Search for a package
choco search <name>

# Get details on a package
choco info <name>

# Upgrade a specific package
choco upgrade <package> -y

# Upgrade everything
choco upgrade all -y

# Uninstall a package
choco uninstall <package> -y

# Check for outdated packages
choco outdated
```

---

## Tips

- **Always run as Administrator.** The script enforces this with `#Requires -RunAsAdministrator` and will fail immediately if not elevated.
- **The `-y` flag** auto-confirms all prompts. Without it, Chocolatey will ask you to confirm each install interactively.
- **Idempotent installs.** Running the script again on an already-configured machine is safe — Chocolatey will skip packages that are already installed at their current version.
- **Adding packages.** To add more software, find the package name on [community.chocolatey.org/packages](https://community.chocolatey.org/packages) and add a `choco install <name> -y` line to the appropriate function in `setup-env.ps1`.
- **Corporate environments.** If your network uses a proxy, set the `$env:chocolateyProxyLocation` environment variable before running. See the comments in `install.ps1` for details.
