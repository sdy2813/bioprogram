# zinit安装与配置

```
zsh -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust \
    zdharma-continuum/fast-syntax-highlighting

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=20000
SAVEHIST=20000
bindkey -e
# End of lines configured by zsh-newuser-install

#Plugin
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit ice depth=1; zinit light romkatv/Powerlevel10k

#zinit ice lucid wait='1'
#zinit light skywind3000/z.lua
zinit snippet OMZ::plugins/extract
zinit light agkozak/zsh-z
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Uncomment the following line to use case-sensitive completion.
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

```




---
参考资料：
1. [zsh 启动速度慢的终极解决方案](https://zhuanlan.zhihu.com/p/98450570)
2. 
