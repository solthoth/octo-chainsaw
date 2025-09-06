# Octo-Chainsaw
Config files for quick development setup for all my systems (OSX, Win, etc...)

# Machine Setup

## OSX
Install tools via terminal

### Install Via Homebrew

```zsh
$ cd ./homebrew
$ sh ./setup-dev.sh
```

### Configure Git

Include the gitconfig file from this repo into your global gitconfig file. This allows custom overrides from the global file, and still having a consistent base.

```zsh
$ git config --global include.path ./gitconfig
```

## Windows
Install tools via powershell

```ps
ps $> .\choco\setup-env.ps1
```
# References
Below are a list of sites/repos from where I get most of my information from.

**Repos**
* [mdo/config](https://github.com/mdo/config)
