if [ -f ~/.zshrcx ]; then
  source ~/.zshrcx
fi
EDITOR=nano

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
bindkey -e

function install_antigen {
  echo "Install Antigen"
	if where opkg &> /dev/null; then
		echo "OPKG based system detected, install curl and git with opkg, then install antigen with fallback..."
		opkg install curl
		opkg install git
		install_antigen_fallback
	else
		echo "Do you want to install fallback antigen(download it to ~/.antigen/antigen.zsh)? [y/N]"
		read yn
		case $yn in
			[Yy]* ) install_antigen_fallback;;
			* ) echo "Abort...";;
		esac
	fi
}

function install_antigen_fallback {
	mkdir -p ~/.antigen
	curl -L git.io/antigen > ~/.antigen/antigen.zsh
}

if [ ! -f /usr/share/zsh/share/antigen.zsh ] && [ ! -f ~/.antigen/antigen.zsh ]; then
  install_antigen
  if [ ! -f /usr/share/zsh/share/antigen.zsh ] && [ ! -f ~/.antigen/antigen.zsh ]; then
    exit 1
  fi
fi

if [ -f /usr/share/zsh/share/antigen.zsh ]; then
	source /usr/share/zsh/share/antigen.zsh
elif [ -f ~/.antigen/antigen.zsh ]; then
	source ~/.antigen/antigen.zsh
fi

antigen use oh-my-zsh

antigen bundle git
antigen bundle git-extra
antigen bundle mvn
antigen bundle pip
antigen bundle rails
antigen bundle systemd
antigen bundle docker
antigen bundle docker-compose
antigen bundle scala
antigen bundle sbt
antigen bundle gitignore
antigen bundle gradle
antigen bundle rails

antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

autoload -Uz compinit
compinit

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats "(%F{blue}%s%f:%F{yellow}%b%f)"
zstyle ':vcs_info:git*' formats "(%F{cyan}%s%f:%F{yellow}%b%f)"

zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

precmd() {
    vcs_info &>/dev/null
}

autoload -Uz promptinit
promptinit
prompt redhat

setopt PROMPT_SUBST
setopt extended_glob

function battery {
  batid=$1
  cap=$(upower -i $batid | grep -Po "(?<=percentage:).*" | grep -Po "\d+" )
  adapter=$(upower -i $batid | grep -Po "(?<=state:).*" | grep -Po "[A-Za-z\-]+")
  color="red"
  if [[ $cap -gt 15 ]] && [[ $cap -lt 50 ]]; then color="yellow"; fi
  if [[ $cap -ge 50 ]]; then color="green"; fi
  rprompt="%F{$color}$cap"
  if [ "$adapter" = "discharging" ]; then 
    rprompt="$rprompt%%%f";
  else 
    rprompt="$rprompt%f%F{yellow}↯%f";
  fi
  echo $rprompt
}

function temp {
  t=$(cat /sys/class/thermal/thermal_zone0/temp)
  full_temp="$(( t / 1000 )).$((t % 1000 / 100))'C"
  temp=$( echo $t | cut -c1,2 )
  color="green"
  if [[ $temp -gt 60 ]] && [[ $temp -lt 80 ]]; then color="yellow"; fi
  if [[ $temp -ge 80 ]]; then color="red"; fi
  echo "%F{$color}$full_temp%f"
}

function extension {
  if where upower &>/dev/null && [ "$(upower -e | grep -m1 "battery")" != "" ]; then
    battery $(upower -e | grep -m1 "battery")
  elif [ -f "/sys/class/thermal/thermal_zone0/temp" ]; then
    temp
  fi
}

function version_control() {
  echo ${vcs_info_msg_0_}
}

if where glances &>/dev/null; then
	alias glances='glances'
	alias top='glances'
fi
alias vi='vim'

#if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  bindkey "\e[1~" beginning-of-line
  bindkey "\e[4~" end-of-line
  bindkey "\e[5~" beginning-of-history
  bindkey "\e[6~" end-of-history
  bindkey "\e[7~" beginning-of-line
  bindkey "\e[3~" delete-char
  bindkey "\e[2~" quoted-insert
  bindkey "\e[5C" forward-word
  bindkey "\e[5D" backward-word
  bindkey "\e\e[C" forward-word
  bindkey "\e\e[D" backward-word
  bindkey "\e[1;5C" forward-word
  bindkey "\e[1;5D" backward-word
  bindkey "\e[8~" end-of-line
  bindkey "\eOH" beginning-of-line
  bindkey "\eOF" end-of-line
  bindkey "\e[H" beginning-of-line
  bindkey "\e[F" end-of-line
#fi

PROMPT="[%F{red}%n%f@%F{blue}%m%f:%F{green}%1~%f]%# "
RPROMPT='$(version_control)$(extension)%'

alias myip="curl https://www.monip.org -s | grep -Po --color=never \"(?<=IP : )[\d\.]+\""
if where filebot &>/dev/null; then
	alias filebot_movie="filebot -no-xattr -non-strict -rename --lang ger --db TheMovieDB --format \"{n.colon(' - ')} ({y}){' CD'+pi}\""
	alias filebot_serie="filebot -no-xattr -non-strict -rename --order airdate --lang ger --db TheTVDB --format \"./{n}/Season {s.pad(2)}/{n} - {s00e00} - {t}\""
	alias filebot_season="filebot -no-xattr -non-strict -rename --order airdate --lang ger --db TheTVDB --format \"./Season {s.pad(2)}/{n} - {s00e00} - {t}\""
	alias filebot_episodes="filebot -no-xattr -non-strict -rename --order airdate --lang ger --db TheTVDB --format \"./{n} - {s00e00} - {t}\""
fi

if [ "$XDG_SESSION_DESKTOP" = "gnome" ]; then
	alias afk="dbus-send --type=method_call --dest=org.gnome.ScreenSaver /org/gnome/ScreenSaver org.gnome.ScreenSaver.Lock"
fi

function rsync {
  
  if [ -f ./.rsyncignore ]; then
    /usr/bin/rsync --progress --partial -hr --exclude-from=./.rsyncignore $@
  else
    /usr/bin/rsync --progress --partial -hr $@
  fi
}

alias dd=dd status=progress

# Load rbenv automatically by appending
# the following to ~/.zshrc:

if where rbenv &>/dev/null; then
	eval "$(rbenv init -)"
fi

if where pyenv &>/dev/null; then
	eval "$(pyenv init -)"
	eval "$(pyenv virtualenv-init -)"
fi

# Thanks To CS :laughing:
alias hosenschlange37=python3
