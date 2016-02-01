# Setting prompts for git awareness
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source ${GITAWAREPROMPT}/main.sh
export PS1="\u@\h \w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
export SUDO_PS1="\[$bakred\]\u@\h\[$txtrst\] \w\$ "

# Go environment setup
export GOPATH=$HOME/go

#Aliases for showing and hiding hidden files
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

#Aliases for creating gitignore files
alias ignore-win='curl https://www.gitignore.io/api/windows >> .gitignore'
alias ignore-osx='curl https://www.gitignore.io/api/osx >> .gitignore'
alias ignore-go='curl https://www.gitignore.io/api/go >> .gitignore'
alias ignore-node='curl https://www.gitignore.io/api/node >> .gitignore'
alias ignore-vsc='curl https://www.gitignore.io/api/visualstudiocode >> .gitignore'
