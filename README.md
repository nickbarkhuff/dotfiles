## Install
### Clone Repo
Clone recursively to download all Vim plugins.<br/>
`git clone --recursive https://github.com/nickbarkhuff/dotfiles ~/dotfiles`<br/>

### Create Symlinks
Specify a config file from the *configs* folder.<br/>
`~/dotfiles/install.sh MYCONFIG.txt`<br/>

### Get Packages
The *packages.sh* script installs all of my desired programs/dependencies.<br/>
`~/dotfiles/packages.sh`<br/>

### Add Fonts
The Vim plugin "Airline" uses special characters that are only included in Powerline fonts. To install these fonts, clone the repo below and run the provided installation script. The repository can be removed after installation. Remember to set your terminal to use one of the installed fonts.<br/>

`git clone https://github.com/powerline/fonts ~/fonts`<br/>
`~/fonts/install.sh`<br/>
`rm -rf ~/fonts`<br/>

I use *DejaVu Sans Mono for Powerline Book*, but any "for Powerline" font will work.<br/><br/>


## Uninstall
### Remove Symlinks
Run the provided uninstall script.<br/>
`~/dotfiles/uninstall.sh`<br/>

### Remove Repository
Completely remove the repository.<br/>
`rm -rf ~/dotfiles`<br/><br/>


## Vim Repositories
### Color Schemes
| Name            | GitHub Repo                                |
| --------------- | ------------------------------------------ |
| Monokai         | https://github.com/crusoexia/vim-monokai   |

### Syntax Highlighters
| Name            | GitHub Repo                                 |
| --------------- | ------------------------------------------- |
| CSS3            | https://github.com/hail2u/vim-css3-syntax   |

### Plugins
| Name             | GitHub Repo                                   |
| ---------------- | --------------------------------------------- |
| Pathogen         | https://github.com/tpope/vim-pathogen         |
| Airline          | https://github.com/vim-airline/vim-airline    |
| CtrlP            | https://github.com/ctrlpvim/ctrlp.vim         |
| Fugitive         | https://github.com/tpope/vim-fugitive         |
| TComment         | https://github.com/tomtom/tcomment_vim        |
| SuperTab         | https://github.com/ervandew/supertab          |
| Auto Pairs       | https://github.com/jiangmiao/auto-pairs       |
| Surround         | https://github.com/tpope/vim-surround         |
| Repeat           | https://github.com/tpope/vim-repeat           |
| Tabular          | https://github.com/godlygeek/tabular          |
| Emmet            | https://github.com/mattn/emmet-vim            |
| CSS Color        | https://github.com/ap/vim-css-color           |
