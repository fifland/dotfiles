#!/bin/sh

echo "Installing: Atom packages"
#packages
apm install file-icons
apm install docblockr
apm install minimap
apm install project-manager
apm install ensime

apm install sublime-style-column-selection

#language support
apm install language-latex
apm install language-scala

#themes
apm install tomorrow
apm install spectrum-light-syntax
apm install chester-atom-syntax
apm install nucleus-dark-ui
