

My Cli Tools I use

## cd replacement
brew install zoxide

## better space analyter
brew install ncdu

## nerdfont for terminal
brew install font-jetbrains-mono-nerd-font

## lazygit
brew install jesseduffield/lazygit/lazygit

## ripgrep for nvim and searching
brew install ripgrep

## the wezterm terminal
brew install wezterm

## llddb as debugging adapter for rust 
brew install lldb

## pngpaste to allow image pasting with obsidian nvim
brew install pngpaste

-----------------------------------------

# Windows Setup

## Terminal WezTerm 
>WezTerm is a powerful cross-platform terminal emulator and multiplexer written by @wez and implemented in Rust

Wezterm ist die oberste Ebene mit der ich alles weitere betreibe. 

https://wezfurlong.org/wezterm/index.html#features


### Installation
Windows
```winget install wez.wezterm```

Mac/ Linux
```brew install --cask wezterm```

### Setup
Ich nutze auf Windows die Windows-Version, um darin WSL auszuführen.
Konfiguration üer Lua Skript. Es kann praktisch alles verändert und modifiziert werden. In meinem Setup nutze ich nur ein Fenster ohne Tabs, mit einem Hintergrundbild.

Es wird empfohlen eine Nerdfont zu nutzen. Diese beinhölt weitere sybole, welche von vielen tools genutzt werden. Es gibt eine vielzahl von Nerdfonts (https://www.nerdfonts.com/) ich nutze jetbrains.
```brew install font-jetbrains-mono-nerd-font```
Diese muss im lua für wezterm ausgewählt werden. 

# WSL Setup
 Von den aufgeführten Tools ist WezTerm das einzige welches direkt auf Windows Installiert und ausgeführt wird, alles weitere befindet sihc innerhalb der WSL
 Alle konfigurationen werden nach dem `XDG_CONFIG_HOME` gespeichert.
 
## Oh-my-zsh
https://ohmyz.sh/

Innerhalb der WSL habe ich die Bash mit zsh ersetzt, genauer der ohmyzsh configuration. Oh-My-Zsh erlaubt viele Erweiterungen wie Plugins und Themes.

### Installation 
```sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"```

### Setup
ohmyzsh legt eine ~/.zshrc an. In dieser können alle möglichen Konfirurationen wie aliase, Configs, Plugins, etc. abgelgt werden. 
Alle weiteren CLi Tools die ich nutze werden, wenn sie konfiguriert oder geladenw erden müssen, in der der `~/.zshrc` hinterlegt.

Plugins:
```
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)
```
Theme:
`ZSH_THEME="powerlevel10k/powerlevel10k"` -> https://github.com/romkatv/powerlevel10k

Eingie Aliase:
```
## MAven
alias mc='mvn clean'
alias mcc='mvn clean compile'
alias mci='mvn clean install'
alias mciu='mvn clean install -U'

# chrome
alias gooc='google-chrome &'
```

## Tmux multiplexer
Innerhalb des Terminals betreibe ich tmux. Tmux wird praktisch bei Start jeder Session gestartet und alles weitere passiert innerhalb von tmux. 

https://github.com/tmux/tmux/wiki

Tmux erlaubt es mir innerhalb meines Terminals mehrere Fenster zu öffnen, Split-View, Sessions Attachen oder detachen etc. Außerdem erlaubt Tmux die installation von Plugins und Themes, die einem weitere Informationen anzeigen.

### Installation
```brew install tmux```

### Setup:
[Mein Setup File](./tmux/tmux.conf)

Hier installiere ich verschiedene Plugins und das Dracula THema https://github.com/dracula/tmux welches mir weitere Inforationen in einer Zeile anzeigt.
Tmux wird über `tmux` ausgeführt. 

### Hilfe
https://tmuxcheatsheet.com/

## CLI Tools
zsh, Tmux und wezterm bilden die Grundlage. Innerhalb dieser Grundlge nutze ich folgende Tools, bei denen ich jedoch standards wie `git` oder `maven` aus lasse. 

###  terraform aliase
https://github.com/zer0beat/terraform-aliases/tree/master

### zoxide
zoxide ist ein replacement für CD. Es merkt sich häufig besuchte Verzeichnisse und beschleunigt so die Navigation. 
https://github.com/ajeetdsouza/zoxide 

#### Installation
```brew install zoxide```

#### Setup
```
alias cd=z

# zoxide
eval "$(zoxide init zsh)"
```


### lazygit
Lazygit ist eine Terminal-Gui zur bedienung von Git. https://github.com/jesseduffield/lazygit/tree/master

#### Installation
```brew install jesseduffield/lazygit/lazygit```

### lazydocker
#### Installation

## Text verarbeitung mit NeoVim
NeoVim (https://neovim.io/) ist einer der jüngsten Ableger von vi. NeoVim kann voll über Lua konfiguriert und mit Plugins angereichert werden. 

Installation:
```brew install neovim```

### Distribution NvChad
NeoVim kann vom Grundauf komplett selber durch Lua konfiguriert und angepasst werden. Package manager wie mason und lazy helfen dabei Plugins zu installieren. 
Für den Einstieg bietet es sich an eine Distribution zu nutzen. Diese sind vorgkonfiguriert mit Plugins, Mappings und Themes. 

Ich nutze die NvChad distribution https://nvchad.com/ als Grundlage und baue meine eigene Erweiterung darauf auf. 

Neben NvChad gibt es andere Distributionen die mehr oder weniger Features mitbringen und so andere Grundlagen bieten.
- https://github.com/nvim-lua/kickstart.nvim
- https://github.com/AstroNvim/AstroNvim/tree/main
- https://github.com/LazyVim/LazyVim

### Meine Erweiterungen


## IdeaVim in Intellij

Innerhalb von Intellij nutze ich 





