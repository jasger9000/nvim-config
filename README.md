# jasger's Neovim config

## Contents
My Neovim configuration with all its plugins

## Requirements
- Neovim v10+
- git
- A [patched font](https://www.nerdfonts.com/) (If you're using Arch Linux you can search the package database for something like "ttf nerd" for a list of patched fonts)

## How to Set up
1. Clone the repository into .config/nvim
   
   <b>Make sure to back up your old .config/nvim first!</b>
   ```bash
   cd ~/.config/
   git clone https://github.com/jasger9000/nvim-config.git nvim
   ```
3. Start Neovim and install the plugins
   1. Start Neovim from your shell: `nvim`
   2. In Neovim, Type `:Lazy<CR>` to open the plugin manager
   3. Hit <kbd>I</kbd> to Install the plugins
   4. Type `:q<CR>` to exit the window
4. You're done! 🎉 Enjoy your new config

PS: You will need to restart Neovim after you installed/updated your plugins to load the changes
