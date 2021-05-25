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
* **Shell:** Zsh
* **Development:** git, OpenJDK, OpenJDK, Scala, Ruby, Python
* **Build Tools:** SBT, Gradle
* **Linux Tools:** htop, wavemon, unzip, pandoc, wkhtmltopdf, tree
* **Editors:** Atom, nano, vim
* **Web:** Firefox, Thunderbird, plasma-browser-integration
* **Media:** VLC, Gimp, Inkscape
* **Writing & Documenting:** Texlive, Biber, pygmentize, plantuml
* **Deployment:** Docker + docker-compose

##### Pacman (non-essential)
* **Communication:** Telegram Desktop, Teamspeak3, Element Desktop
* **Media:** kdenlive

#### AUR
To simplify the use of the Arch User Repositories, `pikaur` can be installed. If so, the folowing AUR Packages can be installed:
* **Browser:** Google Chrome
* **Development:** JetBrains Toolbox, rbenv, ruby-build

##### AUR (non-essential)
* **Writing & Documenting:** DrawIO Desktop
* **Development:** JFX Scenebuilder
* **Communication:** Slack Desktop, Zoom
* **Tools:** Anydesk, ddrescue-gui, eagle
* **Fun:** Edex-UI

#### Other separately selectable Packages
* Insync (Cloud (GoogleDrive / OneDrive) Sync Client)
* Spotify
* CKB-Next Corsair Driver
* OBS (Streaming and Recording Software with virtual Webcam)
  * obs-studio (Main Application)
  * v4l2loopback-dkms (Kernel Module for virtual Webcam)
  * obs-freeze-filter (Additional Effect Plugin)
  * obs-streamfx (Additional Effect Plugin)
  * obs-v4l2sink (Advanced Loopback Plugin)


## Usage
Clone this Repo (recommended into the home folder):
```
cd ~
git clone git@github.com:fmuenscher/dotfiles.git
```
Then rename the `dotfiles` folder to `.dotfiles` to hide it and enter the folder:
```
mv dotfiles .dotfiles
cd .dotfiles
```
Then run the setup script:

On Arch-based systems simply run:

```
./setup.sh
```
The script then runns as follows:
```
Setup-Script Started
Generating GitConfig

Full Name:
E-Mail Adress:

Correct? Press [Enter] key to continue...

Starting full system update

Setting up: zshrc
Setting up: gitconfig
Setting up: vim
Setting up: prelude
Setting up: sbt plugins

Install zsh? [y/N] (recommended)
...
Install Pikaur? [y/N] (recommended)
...
Install Pacman Packages? [y/N] (recommended)
...
Install Pacman non essential Packages? [y/N]
...
Install AUR Packages? [y/N] (recommended)
...
Install non essential AUR Packages? [y/N]
...
Install Atom Packages? [y/N]
...
Install Insync (Google Drive Sync Client)? [y/N]
...
Install Spotify? [y/N]
...
Install CKB-Next Corsair Driver? [y/N]
...
Install OBS? [y/N]
...
Set zsh default? [y/N] (recommended)
...
Increase Inotify Watches Limit? [y/N]  (recommended)
...

```

On Debian-based systems run

```
./setup_debian.sh
```
From there on, the script looks about the same.
