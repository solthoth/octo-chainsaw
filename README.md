# Octo-Chainsaw

Dotfiles and bootstrap scripts for quickly setting up a developer workstation on macOS or Windows.

## What's Inside

```
octo-chainsaw/
├── gitconfig                  # Shared Git configuration (aliases, defaults, GPG)
├── homebrew/                  # macOS setup via Homebrew
│   ├── setup-dev.sh           # Installs/updates Homebrew
│   ├── personal/Brewfile      # Full personal machine setup
│   └── professional/Brewfile  # Leaner work machine setup
└── choco/                     # Windows setup via Chocolatey
    ├── install.ps1            # Installs Chocolatey itself
    └── setup-env.ps1          # Installs packages via Chocolatey
```

---

## macOS Setup

### 1. Install Homebrew and tools

```zsh
./homebrew/setup-dev.sh
```

> On Apple Silicon, follow the post-install prompt to add Homebrew to your PATH.

### 2. Install a Brewfile bundle

```zsh
# Personal machine
brew bundle install --file ./homebrew/personal/Brewfile

# Professional / work machine
brew bundle install --file ./homebrew/professional/Brewfile
```

See [homebrew/README.md](homebrew/README.md) for a full breakdown of what each Brewfile installs, cleanup mode, and useful Homebrew commands.

---

## Windows Setup

### 1. Open an elevated PowerShell session

Right-click **Windows PowerShell** or **Windows Terminal** → **Run as Administrator**.

### 2. Allow script execution (one-time)

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### 3. Run the setup script

```powershell
.\choco\setup-env.ps1
```

This installs Chocolatey and then all packages. You can scope the install with the `-Apps` flag:

```powershell
.\choco\setup-env.ps1 -Apps DEV    # Developer tools only
.\choco\setup-env.ps1 -Apps USER   # GUI apps only
.\choco\setup-env.ps1 -Apps SYS    # System utilities only
.\choco\setup-env.ps1 -SkipChocolatey  # Skip Chocolatey install if already present
```

See [choco/README.md](choco/README.md) for a full package list and usage reference.

---

## Git Configuration

This repo includes a shared `gitconfig` with sensible defaults. Hook it into your global Git config so your machine inherits it without overwriting your personal settings:

```zsh
git config --global include.path /path/to/octo-chainsaw/gitconfig
```

**What it sets:**

| Setting | Value |
|---|---|
| `push.autoSetupRemote` | `true` — no more `--set-upstream` on first push |
| `pull.rebase` | `true` — rebases instead of merge commits on pull |
| `init.defaultBranch` | `main` |
| `alias.lg` | Pretty graph log: `git lg` |
| `gpg.format` | `openpgp` (configure your signing key as needed) |

---

## References

- [mdo/config](https://github.com/mdo/config)
- [Homebrew](https://brew.sh)
- [Chocolatey](https://chocolatey.org)
