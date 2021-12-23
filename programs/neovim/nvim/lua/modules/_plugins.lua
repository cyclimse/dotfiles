local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

return require('packer').startup(function()

use 'wbthomason/packer.nvim'

-- Theme
use {'drewtempelmeyer/palenight.vim'}

-- Lsp
use {'hrsh7th/nvim-compe'}
use {'neovim/nvim-lspconfig'}

-- Zig support
use {'ziglang/zig.vim'}

-- Status bar
use {'hoob3rt/lualine.nvim'}
use {'kyazdani42/nvim-web-devicons'} -- Icons for status bar

-- File tree
use {'kyazdani42/nvim-tree.lua'}

-- Git integration
use {'tpope/vim-fugitive'}

-- Fuzzy finder
use {'junegunn/fzf'}
use {'junegunn/fzf.vim'}
use {'airblade/vim-rooter'}
use {'ojroques/nvim-lspfuzzy'} -- Allows for lsp results to be displayed in vim-fzf

-- Key reminder tool
use {'liuchengxu/vim-which-key'}
use {'AckslD/nvim-whichkey-setup.lua'}

-- Lua library for scripting
use {'nvim-lua/plenary.nvim'}

-- REPL Support
use {'metakirby5/codi.vim'}

-- Markdown preview
use {'npxbr/glow.nvim'}

-- Session manager
use {'rmagatti/auto-session'}

-- Colorizer
use {'norcalli/nvim-colorizer.lua'}

end)