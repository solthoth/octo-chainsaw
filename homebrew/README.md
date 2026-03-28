# Homebrew

A collection of [Homebrew](https://brew.sh) Brewfiles for quickly bootstrapping a new Mac — one for personal machines and one for professional/work machines.

## What is Homebrew?

[Homebrew](https://brew.sh) is the most popular package manager for macOS (and Linux). Think of it like an app store for the terminal — it lets you install developer tools, CLI utilities, and even GUI applications with a single command.

Homebrew installs packages into its own directory (`/opt/homebrew` on Apple Silicon, `/usr/local` on Intel) and symlinks them into `/usr/local/bin`, keeping your system clean and uncluttered.

**Key concepts:**

| Term | What it means |
|---|---|
| `brew install <package>` | Installs a CLI tool or library |
| `brew install --cask <app>` | Installs a GUI macOS application (`.app`) |
| `Brewfile` | A manifest file listing everything you want installed |
| `brew bundle` | Reads a `Brewfile` and installs everything in it |
| `brew update` | Updates Homebrew itself |
| `brew upgrade` | Upgrades all installed packages to their latest versions |
| `brew cleanup` | Removes old versions of installed packages |

---

## Folder Structure

```
homebrew/
├── README.md
├── setup-dev.sh          # Bootstrap script: installs Homebrew itself
├── personal/
│   └── Brewfile          # Tools + apps for a personal machine
└── professional/
    └── Brewfile          # Leaner, work-focused toolset
```

---

## Getting Started

### Step 1 — Install Homebrew

Run the bootstrap script from the root of this repo. It checks if Homebrew is already installed; if not, it installs it. If it is, it runs `brew update`.

```zsh
./homebrew/setup-dev.sh
```

> **Note:** After a fresh Homebrew install on Apple Silicon, you may need to add Homebrew to your shell PATH. Follow the instructions printed at the end of the install — they will look something like:
> ```zsh
> echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
> eval "$(/opt/homebrew/bin/brew shellenv)"
> ```

### Step 2 — Install a bundle

Pick the Brewfile that matches your machine and run:

```zsh
# Personal machine
brew bundle install --file ./homebrew/personal/Brewfile

# Professional / work machine
brew bundle install --file ./homebrew/professional/Brewfile
```

#### Keeping your machine in sync (cleanup mode)

The `--cleanup` flag removes anything installed on your machine that is **not** listed in the Brewfile. This is useful for keeping machines consistent with the manifest.

```zsh
brew bundle install --file ./homebrew/personal/Brewfile --cleanup
```

> **Warning:** `--cleanup` will uninstall packages not in the Brewfile. Review the output before confirming if you have manually installed tools you want to keep.

#### Check what would be installed or removed (dry run)

```zsh
brew bundle check --file ./homebrew/personal/Brewfile --verbose
```

---

## What's in Each Brewfile

### Personal (`personal/Brewfile`)

A full-featured setup for a personal developer machine, including GUI apps, AI tools, and a rich VS Code extension set.

**CLI Tools & Languages**

| Package | Description |
|---|---|
| `git` | Version control |
| `gh` | GitHub CLI |
| `go` | Go programming language |
| `nvm` | Node Version Manager |
| `python` (via pydantic) | Python runtime support |
| `tree` | Display directory trees |

**Cloud & Infrastructure**

| Package | Description |
|---|---|
| `azure-cli` | Microsoft Azure CLI |
| `terraform` | Infrastructure as Code (HashiCorp) |
| `opentofu` | Open-source Terraform fork |
| `kubectl` | Kubernetes CLI |
| `kustomize` | Kubernetes config management |
| `argocd` | GitOps continuous delivery for Kubernetes |
| `kind` | Run Kubernetes clusters locally via Docker |
| `flux` | GitOps toolkit for Kubernetes |

**Security & Secrets**

| Package | Description |
|---|---|
| `age` | Simple, modern file encryption |
| `sops` | Secrets manager (works with age, AWS KMS, etc.) |
| `libsodium` | Modern cryptography library |

**AI / LLM**

| Package | Description |
|---|---|
| `ollama` | Run large language models locally |
| `llm` | CLI for interacting with LLMs |

**GUI Applications (Casks)**

| App | Description |
|---|---|
| Brave Browser | Privacy-focused Chromium browser |
| Google Chrome | Google's browser |
| Claude | Anthropic's Claude desktop app |
| Docker Desktop | Container management GUI |
| VS Code | Microsoft's code editor |
| Warp | Modern AI-powered terminal |
| GoLand | JetBrains Go IDE |
| IntelliJ IDEA | JetBrains multi-language IDE |
| WebStorm | JetBrains JavaScript IDE |
| Postman | API testing & development |
| pgAdmin 4 | PostgreSQL GUI client |
| GitKraken CLI | Git CLI companion |
| Slack | Team messaging |
| Zoom | Video conferencing |
| Discord | Community chat |
| Signal / WhatsApp / Messenger | Messaging apps |
| Obsidian | Knowledge base / note-taking |
| Microsoft Office | Office productivity suite |
| Dropbox | Cloud file storage |
| ngrok | Expose local servers to the internet |
| SoundSource | macOS audio routing control |
| Wine Stable | Run Windows apps on macOS |

**VS Code Extensions**

Includes extensions for Go, Docker, Kubernetes, Terraform, Playwright, GitHub Copilot, Claude Code, Angular, C#/.NET, SQL, and more.

---

### Professional (`professional/Brewfile`)

A leaner, work-focused setup. Uses `colima` (a lightweight VM runtime) instead of Docker Desktop for a fully open-source container stack.

**CLI Tools**

| Package | Description |
|---|---|
| `git` | Version control |
| `gh` | GitHub CLI |
| `curl` | HTTP client |
| `jq` | JSON processor |
| `tree` | Directory tree viewer |

**Cloud & Infrastructure**

| Package | Description |
|---|---|
| `terraform` | Infrastructure as Code |
| `kubectl` | Kubernetes CLI |
| `helm` | Kubernetes package manager |
| `azure-cli` | Microsoft Azure CLI |
| `awscli` | Amazon Web Services CLI |
| `docker` | Container CLI (without Docker Desktop GUI) |
| `colima` | Lightweight container runtime (Docker Desktop alternative) |

**Security & Secrets**

| Package | Description |
|---|---|
| `sops` | Secrets manager |
| `age` | File encryption |

**Languages & Runtimes**

| Package | Description |
|---|---|
| `nvm` | Node Version Manager |
| `go` | Go programming language |
| `python` | Python runtime |

**AI / LLM**

| Package | Description |
|---|---|
| `ollama` | Run LLMs locally |

**GUI Applications (Casks)**

| App | Description |
|---|---|
| VS Code | Code editor |
| iTerm2 | Feature-rich macOS terminal |
| Brave Browser | Privacy-focused browser |
| Discord | Community chat |

---

## Useful Homebrew Commands

```zsh
# See what's installed
brew list

# Search for a package
brew search <name>

# Get info on a package
brew info <name>

# Update Homebrew and all package definitions
brew update

# Upgrade all installed packages
brew upgrade

# Remove old versions of packages
brew cleanup

# Check your system for potential problems
brew doctor

# Generate a Brewfile from what's currently installed
brew bundle dump --file ./Brewfile
```

---

## Tips

- **Apple Silicon (M1/M2/M3/M4):** Homebrew lives at `/opt/homebrew`. Intel Macs use `/usr/local`. If you see "command not found" after installing, make sure your PATH is set correctly (see Step 1 above).
- **Cask apps require macOS permissions:** The first time you open a cask-installed app, macOS may ask you to confirm it in **System Settings > Privacy & Security**.
- **`nvm` requires shell config:** After `brew install nvm`, follow the post-install instructions to add the nvm initialization to your `~/.zshrc` or `~/.zprofile`.
- **`colima` (professional):** Start the runtime with `colima start` before using Docker commands. It uses less RAM than Docker Desktop and has no licensing restrictions for commercial use.
