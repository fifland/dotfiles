# Dotfiles
#### A simple collection of Linux config and setup scripts mostly for Arch and Debian.

## What's inside?

* Install scripts for Arch and Debian based systems
  * Pacman and AUR packages
* `.zshrc` Config file for the Zsh
* `.gitconfig` Config file for git
* `.vimrc` and `vim` Advanced config files for vim
* SBT Plugin configuration files
* Emacs config with Prelude

## Install Scripts
The install scripts can be used to install frequently used software.
On Arch everything useful for a desktop system is installed.

The Debian installer is mostly targeted on Debain and Ubuntu server installations, therefore nothing requiring an X-Server is installed

### Arch
On Arch the folowing software will be installed:
#### Pacman
* Zsh
* git
* vim
* Ruby
* Python
* Scala + SBT
* Gradle
* Docker + docker-compose
* Texlive + Biber
* wkhtmltopdf
* Firefox
* Thunderbird
* Atom
* Inkscape
* VLC
* Telegram
* Teamspeak3

#### AUR
To simplify the use of the Arch User Repositories, `pikaur` can be installed. If so, the folowing AUR Packages can be installed:
* Google Chrome
* rbenv + ruby-build
* Oracle Java JDK + JFX Scenebuilder
* Jetbrains Toolbox
* Insync - Goole Drive Client
* Drawio
* Spotify


## Usage

On Arch-based systems simply run

```
./setup.sh
```
The script then runns as follóws:
```
~/.dotfiles# ./setup.sh

Full Name:
E-Mail Adress:

Correct? Press [Enter] key to continue...

Setting up: zshrc
Setting up: gitconfig
Setting up: vim
Setting up: prelude
Setting up: sbt plugins

Install zsh? [y/N]
...
Install Pikaur? [y/N]
...
Install Pacman Packages? [y/N]
...
Install AUR Packages? [y/N]
...
Install Atom Packages? [y/N]
...
Install Insync (Google Drive Sync Client)? [y/N]
...
Set zsh default? [y/N]
...

```

On Debian-based systems run

```
./setup_debian.sh
```
From there on, the script looks mostly the same.
