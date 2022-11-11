return require ('packer').startup(function()
	-- packer can manage itself
	use 'wbthomason/packer.nvim'
	-- colorscheme 
	use 'folke/tokyonight.nvim'


	require("tokyonight").setup({
		style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
		transparent = true, -- Enable this to disable setting the background color
		on_highlights = function(hl, c)
			local prompt = "#2d3149"
			hl.TelescopeNormal = {
				bg = c.bg_dark,
				fg = c.fg_dark,
			}
			hl.TelescopeBorder = {
				bg = c.bg_dark,
				fg = c.bg_dark,
			}
			hl.TelescopePromptNormal = {
				bg = prompt,
			}
			hl.TelescopePromptBorder = {
				bg = prompt,
				fg = prompt,
			}
			hl.TelescopePromptTitle = {
				bg = prompt,
				fg = prompt,
			}
			hl.TelescopePreviewTitle = {
				bg = c.bg_dark,
				fg = c.bg_dark,
			}
			hl.TelescopeResultsTitle = {
				bg = c.bg_dark,
				fg = c.bg_dark,
			}
		end,
	})
	use "nvim-lua/plenary.nvim"

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		'nvim-telescope/telescope-fzf-native.nvim', run = 'make',
		'nvim-telescope/telescope-file-browser.nvim',
		-- or                            , branch = '0.1.x',
		require('telescope').setup {
			extensions = {
				fzf = {
					fuzzy = true,                    -- false will only do exact matching
					override_generic_sorter = true,  -- override the generic sorter
					override_file_sorter = true,     -- override the file sorter
					case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
				}
			}
		}
	}
	use 'glepnir/dashboard-nvim'
	use 'xiyaowong/telescope-emoji.nvim'
	require("telescope").load_extension "file_browser"
	require("telescope").load_extension "emoji"
	use {
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	}
	use "lukas-reineke/indent-blankline.nvim"

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	
	use {
		'phaazon/hop.nvim',
		branch = 'v2',
		config = function()
			require'hop'.setup {}
		end
	}
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use {'nvim-treesitter/nvim-treesitter-textobjects'}
	use 'p00f/nvim-ts-rainbow' 

	require'nvim-treesitter.configs'.setup {
		indent = {
			enable = true
		},
		autotag = {
			enable = true,
		},
		rainbow = {
			enable = true,
			extended_mode = true,
			max_file_lines = nil,
		}
	}

	use {
	"folke/trouble.nvim",
	requires = "kyazdani42/nvim-web-devicons",
	config = function()
		require("trouble").setup {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		}
	end
	}

	use 'folke/lsp-colors.nvim'
	require("lsp-colors").setup({
		Error = "#db4b4b",
		Warning = "#e0af68",
		Information = "#0db9d7",
		Hint = "#10B981"
	})
	-- using packer.nvim
	use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'kyazdani42/nvim-web-devicons'}
	vim.opt.termguicolors = true
	require("bufferline").setup{
		options = {
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local icon = level:match("error") and " " or " "
			return " " .. icon .. count
			end
		}
	}
	use 'm4xshen/autoclose.nvim'
	use 'preservim/nerdcommenter'
	use 'neovim/nvim-lspconfig'
	use 'williamboman/nvim-lsp-installer'
	require("nvim-lsp-installer").setup {}
	use 'yamatsum/nvim-cursorline'
	require('nvim-cursorline').setup {
		cursorline = {
			enable = true,
			timeout = 1000,
			number = false,
		},
		cursorword = {
			enable = true,
			min_length = 3,
			hl = { underline = true },
		}
	}
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'saadparwaiz1/cmp_luasnip'	
	use 'L3MON4D3/LuaSnip'
	use {"akinsho/toggleterm.nvim", tag = '*', config = function()
		require("toggleterm").setup({
			direction='float',
			open_mapping = '<C-g>',
		})
	end}
	use 'folke/twilight.nvim'
	use 'folke/zen-mode.nvim'
	use 'folke/todo-comments.nvim'
	require('twilight').setup{}
	require('zen-mode').setup{}
	require('todo-comments').setup{}
	use {'kevinhwang91/nvim-hlslens'}
	require('hlslens').setup({
		build_position_cb = function(plist, _, _, _)
			require("scrollbar.handlers.search").handler.show(plist.start_pos)
		end,
	})
	vim.cmd([[
		augroup scrollbar_search_hide
			autocmd!
			autocmd CmdlineLeave : lua require('scrollbar.handlers.search').handler.hide()
		augroup END
	]])
	use("petertriho/nvim-scrollbar")
	local colors = require("tokyonight.colors").setup()
	require("scrollbar").setup({
		handle = {
			color = colors.bg_highlight,
		},
		marks = {
			Search = { color = colors.orange },
			Error = { color = colors.error },
			Warn = { color = colors.warning },
			Info = { color = colors.info },
			Hint = { color = colors.hint },
			Misc = { color = colors.purple },
		}
	})
	use {'neoclide/coc.nvim', branch = 'master', run = 'npm install --frozen-lockfile'}
	use {'yaegassy/coc-blade', run = 'npm install --frozen-lockfile'}
	use ('sheerun/vim-polyglot')
	use ('tpope/vim-surround')
	use ('mattn/emmet-vim')
	vim.cmd([[
		let g:user_emmet_leader_key=','
		let g:user_emmet_install_global=0
		autocmd FileType html,css,vue,blade EmmetInstall
	]])
	use 'karb94/neoscroll.nvim'
	require('neoscroll').setup()
	use 'tpope/vim-sensible'
	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}
	use 'windwp/nvim-ts-autotag'
	require('nvim-ts-autotag').setup()
	use {'mg979/vim-visual-multi', branch = 'master'}
	use 'AndrewRadev/tagalong.vim'
	use 'SirVer/ultisnips'
	use { 'mhartington/formatter.nvim' }
	require("formatter").setup()
	use 'dcampos/nvim-snippy'
	use 'dcampos/cmp-snippy'
 end)
