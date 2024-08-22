export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# source ~/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
# source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh

export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

source ~/.fs_aliases


export PATH=/usr/local/go/bin:$PATH
export PATH=/home/fraser/.local/bin:$PATH
export PATH=/home/fraser/scripts:$PATH
export PATH=/home/fraser/rofiscripts:$PATH
export PATH=/usr/include/freetype2:$PATH
export PATH=/home/fraser/.cargo/bin:$PATH
export PATH=/home/$USER/.config/nvcode/utils/bin:$PATH

export VISUAL=nvim
export EDITOR=$VISUAL
export PAGER=bat
export MANPAGER='nvim +Man!'
export MANWIDTH=999

export WINEARCH=win32
export WINEPREFIX=~/.win32

# export GTK_IM_MODULE=fcitx
# export XMODIFIERS=@im=fcitx
# export QT_IM_MODULE=fcitx

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

export XDG_DATA_DIRS='/home/fraser/.local/share/flatpak/exports/share'
export XDG_DATA_DIRS='/var/lib/flatpak/exports/share':$XDG_DATA_DIRS
export XDG_DATA_DIRS=/usr/local/share/:/usr/share/:/var/lib/flatpak/exports/share:/home/fraser/.local/share/flatpak/exports/share 

autoload -U +X bashcompinit && bashcompinit
autoload -U compinit; compinit

# source $USER/.zsh_completions

complete -o nospace -C /usr/local/bin/bitcomplete bit

export PATH=/home/$USER/.config/nvcode/utils/bin:$PATH

# Start pcloud ios-sync
# pgrep -x ios-sync >/dev/null && echo "ios-sync is already running" || ios-sync &

# neofetch 
fastfetch -l linuxmint_small

# colorscript -r 

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

source ~/.profile


# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

# Install Nim path
export PATH=/home/fraser/.nimble/bin:$PATH

export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

# eval "$(starship preset tokyo-night)"

# ZSH_THEME="dst"

autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc

[ -f "/home/fraser/.ghcup/env" ] && . "/home/fraser/.ghcup/env" # ghcup-env
