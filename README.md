# Installation Instructions

## Pre-requisites:

Before importing any files, install the following:

- iTerm2
  - [https://iterm2.com](https://iterm2.com)
- homebrew
  - [https://brew.sh](https://brew.sh)
- oh my zsh 
  - [https://ohmyz.sh/](https://ohmyz.sh)
- oh my zsh plugins: 
  - `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
  - `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`
  - `git clone https://github.com/ahmetb/kubectx.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/kubectx`
- vim-plugged
  - [https://github.com/junegunn/vim-plug](https://github.com/junegunn/vim-plug) 
  - `curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
- FiraCode Regular (default font used by most profiles)
  - `brew install --cask font-fira-code`
- Grip
  - [https://github.com/joeyespo/grip](https://github.com/joeyespo/grip) 
  - `brew install grip`
 
## File Imports

### iTerm files:

- iTerm Profile
  - Open `iTerm -> Settings -> Profiles`
  - Under "Other Actions..." select "Import Json Profiles..."
  - Select the appropriate json file under `iterm-settings -> profile`
  - (Optional) Right-click the new profile and set it as your default
- iTerm Colors
  - Open `iTerm -> Settings -> Profiles`
  - Select the appropriate profile 
  - Click the Colors tab, expand the "Color Presets" drop-down
  - Select "Import" then select the appropriate `iterm-settings -> colors` itermcolors file
- Background Image
  - Open `iTerm -> Settings -> Profiles`
  - Select the appropriate profile 
  - Click the Window tab
  - Under the Background Image section, select the appropriate image from `iterm-settings -> background-images`
- Font
  - Sometimes the font selection (`iTerm -> Settings -> Profile -> Text`) is left at the default. 
  - If needed, manually reset it to FiraCode, size 13 *(or the recommended setting in the theme)*

### zsh settings:

- zshrc
  - Replace `~/.zshrc` with the `{profile}/zsh-settings/.zshrc` file
    - *if using finder, you may need to press `Cmd+Shift+.` to view hidden files*
  - Close all iTerm instances, or `source ~/.zshrc` in each instance

### vim settings

- vimrc
  - Determine existence of a `~/.vimrc` file
    - If none exists, copy over the `{profile}/vim-settings/.vimrc` file
    - If one already exists, modify or replace its contents as appropriate
- vim color scheme
  - Ensure the vim colors directory exists (`mkdir -p ~/.vim/colors`)
  - Copy the appropriate `vim-settings/{color-scheme}.vim` file into the `~/.vim/colors` directory
- vim plugins
  - Open vim, and run `:PlugInstall` to install all plugins
  - Wait for all plugin installs to complete, and then restart vim
