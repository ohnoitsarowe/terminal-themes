# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions kubectx zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/jamf/bin:/opt/homebrew/bin:/opt/homebrew/bin

# typewriter function for simulated boot up
#   typewrite "string" [min_delay] [max_delay]
#   defaults: 0.003..0.015 seconds per character
typewrite() {
  local text="$1" min="${2:-0.003}" max="${3:-0.015}"
  local i ch esc=0 delay

  # If not a TTY (e.g., piped), just print once
  if [[ ! -t 1 ]]; then
    printf "%s\n" "$text"
    return
  fi

  for (( i=1; i<=${#text}; i++ )); do
    ch="${text[i]}"

    # If we're in an ANSI escape sequence, print without delay until 'm'
    if (( esc )); then
      printf "%s" "$ch"
      [[ "$ch" == "m" ]] && esc=0
      continue
    fi

    # Start of ANSI: ESC = \x1b
    if [[ "$ch" == $'\x1b' ]]; then
      esc=1
      printf "%s" "$ch"
      continue
    fi

    # Normal character with random delay
    printf "%s" "$ch"
    delay=$(( min + ( (RANDOM % 1000) / 1000.0 ) * (max - min) ))
    sleep "$delay"
  done
  printf "\n"
}

# --- LCARS bootup sequence (uses typewriter above)  ---
msgs=(
  $'\e[38;5;45mInitializing LCARS...\e[0m'
  $'\e[38;5;45mCalibrating bioscanners...\e[0m'
  $'\e[38;5;45mActivating friendly enthusiasm subroutine...\e[0m'
)

clear
echo -e "\e[38;5;93m======================================================\e[0m"
echo -e "\e[38;5;93m------------------------------------------------------\e[0m"

sleep 0.50

for msg in "${msgs[@]}"; do
  typewrite "$msg" 0.002 0.010   # tweak per-char speed here
  sleep 0.33
done

echo -e "\e[38;5;93m------------------------------------------------------\e[0m"
echo -e "\e[38;5;93m======================================================\e[0m"
sleep 1.5

# --- Tendi Welcome Sequence (appears instantly) ---
clear
echo -e "\e[38;5;221m[Science Division Terminal Online]\e[0m"
echo ""
echo -e "\e[38;5;51mWelcome, Ensign Tendi!\e[0m"
sleep 0.50

# --- Tendi Tips of the Day ---
typeset -a tips
tips=(
  "Curiosity saves lives (and sometimes replicators)!"
  "Always run a level-1 diagnostic before blaming subspace!"
  "Label your samples—future you is a forgetful Tellarite!"
  "Backup your configs before 'improving' them!"
  "Test in a holodeck, not in main engineering!"
  "Document the experiment, not the excuse!"
  "If it sparks, step back; if it beeps, step closer!"
  "Use version control for your tricorder presets!"
  "Hydrate. Even Andorians do!"
  "When in doubt, ask the computer nicely!"
)

tip_i=$(( (RANDOM % ${#tips[@]}) + 1 ))  # zsh arrays are 1-indexed
tip="${tips[$tip_i]}"

echo -e "\e[38;5;221mRemember:\e[0m \e[38;5;208m${tip}\e[0m"
echo ""
sleep 0.75


# Optional: clear after the splash to reveal a clean prompt
# clear
# clear
# for msg in "Initializing LCARS..." "Calibrating bioscanners..." "Activating friendly enthusiasm subroutine..."; do
#   echo -e "\033[38;5;45m$msg\033[0m"
#   sleep $(awk -v r=$RANDOM 'BEGIN{srand(); printf("%.2f", 0.5 + (r % 1001)/1000)}')
# done
# sleep 0.75

# echo -e "\033[38;5;45m[LCARS SCIENCE TERMINAL v2380.4.7]\033[0m"
# echo -e "\033[38;5;43mInitializing biomedical systems...\033[0m"
# echo -e "\033[38;5;51mWelcome, Ensign Tendi!\033[0m"
# echo -e "\033[38;5;221mRemember:\033[0m \033[38;5;208mCuriosity saves lives (and sometimes replicators)!\033[0m"

source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Make sure the plugin is loaded first
# source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Star Trek: Lower Decks – zsh-syntax-highlighting override
# Uses ANSI color names that map cleanly to the LowerDecks.itermcolors preset

typeset -A ZSH_HIGHLIGHT_STYLES

# === Core token groups ===
ZSH_HIGHLIGHT_STYLES[command]='fg=cyan,bold'           # teal / medical
ZSH_HIGHLIGHT_STYLES[builtin]='fg=blue,bold'           # sciences blue
ZSH_HIGHLIGHT_STYLES[function]='fg=green,bold'         # tealish slot (Ansi 2)
ZSH_HIGHLIGHT_STYLES[alias]='fg=cyan'                  # teal
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=blue'          # blue

# === Data & arguments ===
ZSH_HIGHLIGHT_STYLES[path]='fg=yellow'                 # ops gold
ZSH_HIGHLIGHT_STYLES[globbing]='fg=yellow'             # ops gold
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=magenta'   # plasma purple
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[assign]='fg=green'                # teal-green for variables

# === Status & problems ===
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red,bold'      # command red
ZSH_HIGHLIGHT_STYLES[command-not-found]='fg=red,standout'
ZSH_HIGHLIGHT_STYLES[comment]='fg=brightblack'         # dim hull gray
ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=cyan'        # teal brackets
ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=blue'        # blue brackets
ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=yellow'      # delta yellow


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Load Angular CLI autocompletion.
# source <(ng completion script)
