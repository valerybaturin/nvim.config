vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Appearence
    use { 'kyazdani42/nvim-web-devicons' }
    use 'navarasu/onedark.nvim'
    use({ 'projekt0n/github-nvim-theme' })
    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'nvim-treesitter/playground' }
    --Lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    -- LSP Lines for LSP Diagnostic Error handling
    use({
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        config = function()
            require("lsp_lines").setup()
        end,
    })

    -- Blankline
    use 'lukas-reineke/indent-blankline.nvim'

    -- Which-Key
    use {
        "folke/which-key.nvim",
    }

    -- Errors
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
    }

    -- Autopair
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- LSP
    -- Configurations for Nvim LSP
    use 'neovim/nvim-lspconfig'
    -- Mason
    use 'williamboman/mason.nvim'

    -- null-ls
    use({
        "jose-elias-alvarez/null-ls.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    })

    -- CMP
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'mfussenegger/nvim-dap'
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
    use 'theHamsta/nvim-dap-virtual-text'
    use 'hrsh7th/cmp-nvim-lua'
    --Icons
    use 'onsails/lspkind-nvim'
    use 'rafamadriz/friendly-snippets'
    -- Snippets
    use {
        'L3MON4D3/LuaSnip',
        after = 'friendly-snippets',
    }
    use 'saadparwaiz1/cmp_luasnip'

    -- GitSigns
    use {
        'lewis6991/gitsigns.nvim',
    }

    -- Toggleterm
    use { "akinsho/toggleterm.nvim", tag = 'v2.*' }

    -- Go
    use 'ray-x/go.nvim'
    use 'ray-x/guihua.lua' -- recommanded if need floating window support
    use('nvim-lua/plenary.nvim')
    -- use('crispgm/nvim-go')

    -- SQL LSP
    use 'nanotee/sqls.nvim'

    -- Comments
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    use {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
    }

end)
