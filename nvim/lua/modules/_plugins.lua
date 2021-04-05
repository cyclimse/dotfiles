 -- Load package
vim.cmd 'packadd paq-nvim'

 -- Import module and bind `paq` function
local paq = require'paq-nvim'.paq

-- Let Paq manage itself
paq {'savq/paq-nvim', opt=true}

-- Colorscheme
paq {'drewtempelmeyer/palenight.vim'}

-- Lsp
paq {'hrsh7th/nvim-compe'}
paq {'neovim/nvim-lspconfig'}

-- Status bar
paq {'hoob3rt/lualine.nvim'}
paq {'kyazdani42/nvim-web-devicons'} -- Icons for status bar

-- File tree
paq {'kyazdani42/nvim-tree.lua'}

-- Git integration
paq {'tpope/vim-fugitive'}

-- Fuzzy finder
paq {'junegunn/fzf'}
paq {'junegunn/fzf.vim'}
paq {'airblade/vim-rooter'}
paq {'ojroques/nvim-lspfuzzy'} -- Allows for lsp results to be displayed in vim-fzf

-- Key reminder tool
paq {'liuchengxu/vim-which-key'}
paq {'AckslD/nvim-whichkey-setup.lua'}

-- Lua library for scripting
paq {'nvim-lua/plenary.nvim'}

-- REPL Support
paq {'metakirby5/codi.vim'}

-- Markdown preview
paq {'npxbr/glow.nvim'}

-- Session manager
paq {'rmagatti/auto-session'}

-- Colorizer
paq {'norcalli/nvim-colorizer.lua'}
