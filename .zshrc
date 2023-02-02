# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/Library/Python/3.10/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH

export HISTCONTROL=ignoredups
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

alias ls='gls --color'
alias nerdctl='nerdctl.lima'
alias docker='nerdctl'

autoload -Uz compinit
compinit

source ~/workspace/sh/z/z.sh

source <(kubectl completion zsh)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light zsh-users/zsh-autosuggestions
zplg ice depth'1' blockf
zinit light zsh-users/zsh-completions

# Plugin history-search-multi-word loaded with tracking.
zinit load zdharma-continuum/history-search-multi-word

zinit ice depth=1; zinit light romkatv/powerlevel10k

zinit ice from"gh-r" as"program"
zinit load junegunn/fzf-bin
setopt promptsubst

zinit ice wait lucid
zinit snippet OMZ::lib/git.zsh
zinit ice wait atload"unalias grv" lucid
zinit snippet OMZ::plugins/git/git.plugin.zsh
#PS1="READY >" # provide a nice prompt till the theme loads
#zinit ice wait'!' lucid
#zinit snippet OMZ::themes/dstufft.zsh-theme
zinit ice wait lucid
zinit snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh


if [[ "${MACHINE_ARCH}" == "aarch64" ]];then
#  # sharkdp/fd
#  zinit ice as"command" from"gh-r" mv"fd* -> fd" bpick"*arm-unknown-linux-gnu*" pick"fd/fd"
#  zinit light sharkdp/fd
#  # sharkdp/bat
#  zinit ice as"command" from"gh-r" mv"bat*/bat -> bat" bpick"*arm-unknown-linux-gnu*" pick"bat"
#  zinit light sharkdp/bat
  # BurntSushi/ripgrep
  zinit ice from"gh-r" as"program" mv"ripgrep* -> ripgrep" bpick"*arm-unknown-linux-gnu*" pick"ripgrep/rg"
  zinit light BurntSushi/ripgrep
  # b4b4r07/httpstat
  zinit ice as"program" cp"httpstat.sh -> httpstat" pick"httpstat"
  zinit light b4b4r07/httpstat
  #dbrgn/tealdeer
  zinit ice as"command" from"gh-r" mv"tldr* -> tldr" bpick"tldr-linux-armv7-musleabihf" pick"dbrgn/tealdeer"
  zinit light dbrgn/tealdeer
  #derailed/k9s
  zinit ice as"command" from"gh-r" mv"k9s* -> k9s" bpick"k9s_Linux_arm64.tar.gz" pick"derailed/k9s"
  zinit light derailed/k9s
  #bootandy/dust
  zinit ice as"command" from"gh-r" mv"dust*unknown-linux-gnu/dust -> dust" bpick"arm-unknown-linux-gnueabihf*" pick"dust"
  zinit light bootandy/dust
  # helix-editor/helix
  zinit ice as"command" from"gh-r" mv"*-aarch64-linux/hx -> hx" bpick"*-aarch64-linux.tar.xz" pick"hx"
  zinit light helix-editor/helix
  #Nukesor/pueue daemon
  zinit ice as"command" id-as"pueued" from"gh-r" bpick"pueued-linux-aarch64" mv"pueued-linux-aarch64 -> pueued" pick"pueued"
  zinit light Nukesor/pueue
  #Nukesor/pueue cli
  zinit ice as"command" id-as"pueue" from"gh-r" bpick"pueue-linux-aarch64" mv"pueue-linux-aarch64 -> pueue" pick"pueue"
  zinit light Nukesor/pueue
  #charmbracelet/glow
  zinit ice as"command" from"gh-r" bpick"*_linux_arm64.tar.gz" pick"glow"
  zinit light charmbracelet/glow
  #Byron/dua-cli
  zinit ice as"command" from"gh-r" bpick"*arm-unknown-linux-gnueabihf.tar.gz" mv"*arm-unknown-linux-gnueabihf/dua-> dua" pick"dua"
  zinit light Byron/dua-cli
  #XAMPPRocky/tokei
  zinit ice as"command" from"gh-r" bpick"tokei-aarch64-unknown-linux-gnu.tar.gz" pick"tokei"
  zinit light XAMPPRocky/tokei
fi

if [[ "${MACHINE_ARCH}" == "aarch64" ]] && [[ "${ENV_CONTAINER_DEV}" == "yes" ]];then
  # aquasecurity/trivy
  zinit ice as"command" from"gh-r" bpick"trivy_*_Linux-ARM64.tar.gz" pick"trivy"
  zinit light aquasecurity/trivy
  # anchore/syft
  zinit ice as"command" from"gh-r" bpick"*linux_arm64.tar.gz" pick"syft"
  zinit light anchore/syft
  # anchore/grype
  zinit ice as"command" from"gh-r" bpick"*linux_arm64.tar.gz" pick"grype"
  zinit light anchore/grype
  # vmware-tanzu/sonobuoy
  zinit ice as"command" from"gh-r" bpick"*_linux_arm64.tar.gz" pick"sonobuoy"
  zinit light vmware-tanzu/sonobuoy
fi

if [[ "${MACHINE_ARCH}" == "aarch64" ]] && [[ "${ENV_ARGO_DEV}" == "yes" ]];then
  # argoproj/argo-workflows
  zinit ice as"command" from"gh-r" bpick"*-linux-arm64.gz" mv"argo-linux-arm64 -> argo" pick"argo"
  zinit light argoproj/argo-workflows
fi

export LS_COLORS="$(vivid generate snazzy)"


# loaded at the end, like it is suggested by the plugin's README
zinit light zdharma-continuum/fast-syntax-highlighting

autoload -Uz compinit && compinit
. ${HOME}/.asdf/asdf.sh

zstyle ':completion:*' menu select

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust
source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"

zinit ice as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' src"zhook.zsh"
zinit light direnv/direnv

toB64() {
	node -p "Buffer.from('${1}').toString('base64')"
}
toUTF8() {
	node -p "Buffer.from('${1}', 'base64').toString('utf-8')"
}

kcluster() {
    kubectl config use-context ${1}
}

klogs() {
	ns=${${2}:-frontend}
	app=${1}
	kubectl logs -n ${ns} -f $(kubectl get pods -n ${ns} | grep "${app}" | awk '{print $1; exit}')
}
