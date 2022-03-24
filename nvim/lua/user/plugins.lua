local fn = vim.fn

-- instalação automática do packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  Packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

local packer = require('packer').startup(function(use)
  use {
      'nvim-lualine/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use 'plasticboy/vim-markdown'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'akinsho/bufferline.nvim'
  use 'mattn/emmet-vim'

  -- nvim com
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  -- colorschemes
  use 'sainnhe/gruvbox-material'
  use 'mhartington/oceanic-next'
  use 'tomasiser/vim-code-dark'
  use 'rakr/vim-one'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if Packer_bootstrap then
    require('packer').sync()
  end
end)

-- lualine
require('lualine').setup({
    options = {
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
    }
})

require('telescope').setup{}
require("bufferline").setup{
   options = {
       numbers = "ordinal",
       diagnostics = "nvim_lsp",
       separator_style = "slant"
   }
}

return packer
