## Installation

1. Create projects directory: `mkdir Projects && cd Projects`
1. Clone the project: `git clone https://github.com/bogem/dotfiles && cd dotfiles`
1. Copy dotfiles: `cp .extra.zsh .spaceshiprc.zsh .vimrc .wezterm.lua .zshrc ~`
1. Install Homebrew: https://brew.sh/
1. Install Homebrew packages: `brew bundle --file=~/Projects/dotfiles`
1. Install vim-plug: https://github.com/junegunn/vim-plug
1. Install oh-my-zsh: https://ohmyz.sh/#install
1. Use zsh as default shell: `echo '/opt/homebrew/bin/zsh' | sudo tee -a /etc/shells && chsh -s /opt/homebrew/bin/zsh`
1. Install zsh plugins that not bundled in oh-my-zsh (e.g. zsh-users/zsh-autosuggestions, Aloxaf/fzf-tab, zsh-users/zsh-syntax-highlighting)
1. Apply settings from .macos: ./.macos

