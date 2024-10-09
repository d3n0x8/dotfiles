# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Chemin vers le répertoire des scripts utilisateur
export PATH="$HOME/bin:/usr/local/bin:$PATH"

# Utilisation d'Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

# Thème
ZSH_THEME="robbyrussell"  # Choisis un thème parmi ceux fournis par Oh My Zsh

# Activation des plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-completions)

# Charger Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Configuration de l'autocomplétion et des suggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#808080'  # Couleur des suggestions
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)  # Options de coloration

# Alias utiles
alias ll='ls -l'
alias la='ls -la'
alias gs='git status'
alias gp='git push'
alias gpull='git pull'

# Historique des commandes
HISTSIZE=10000            # Taille de l'historique
SAVEHIST=10000           # Nombre de commandes à sauvegarder dans .zsh_history
setopt append_history      # Ajoute à l'historique plutôt que de le remplacer
setopt histignoredups      # Ignore les doublons dans l'historique
setopt sharehistory        # Partage l'historique entre toutes les sessions

# Configurations complémentaires
setopt autocd              # Permet d'aller directement dans un répertoire avec son nom
setopt correct             # Correction automatique des commandes mal tapées
setopt interactive_comments # Autorise les commentaires dans l'interaction

# Réglages pour la complétion
autoload -Uz compinit
compinit

# Activer le support de la complétion pour le terminal
zstyle ':completion:*' menu select

# Couleurs dans le terminal
export TERM=xterm-256color

# Vérification de l'existence de la commande 'brew'
if command -v brew >/dev/null; then
  export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
fi

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
