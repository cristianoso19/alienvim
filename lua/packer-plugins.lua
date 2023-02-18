return require ('packer').startup(function()
	use {
		-- packer can manage itself
		'wbthomason/packer.nvim',
		-- colorscheme 
		'folke/tokyonight.nvim',
		'lukas-reineke/indent-blankline.nvim',
		'nvim-lua/plenary.nvim',
		'glepnir/dashboard-nvim',
		'folke/lsp-colors.nvim',
		'lewis6991/gitsigns.nvim',
		'xiyaowong/telescope-emoji.nvim',
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		'nvim-telescope/telescope-fzf-native.nvim', run = 'make',
		'nvim-telescope/telescope-file-browser.nvim',

		'nvim-lualine/lualine.nvim',
		'kyazdani42/nvim-web-devicons',
		'folke/which-key.nvim',
		'phaazon/hop.nvim', branch = 'v2',
		'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
		'nvim-treesitter/nvim-treesitter-textobjects',
		'p00f/nvim-ts-rainbow', 

		'folke/trouble.nvim',
		'akinsho/bufferline.nvim', tag = "v3.*",
		--'m4xshen/autoclose.nvim',
		'preservim/nerdcommenter',
		'neovim/nvim-lspconfig',
		'williamboman/nvim-lsp-installer',
		'yamatsum/nvim-cursorline',
		--COMPLETIONS-----------------
		'hrsh7th/nvim-cmp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-nvim-lua',
		'hrsh7th/cmp-nvim-lsp',
		'saadparwaiz1/cmp_luasnip',	
		'onsails/lspkind-nvim',
		'hrsh7th/cmp-nvim-lsp-signature-help',
		'dcampos/cmp-snippy',
		"roobert/tailwindcss-colorizer-cmp.nvim",
		"windwp/nvim-autopairs",
		--**************************
		'L3MON4D3/LuaSnip',
		'folke/twilight.nvim',
		'folke/zen-mode.nvim',
		'folke/todo-comments.nvim',
		'kevinhwang91/nvim-hlslens',
		'petertriho/nvim-scrollbar',
		'neoclide/coc.nvim', branch = 'master', run = 'npm install --frozen-lockfile',
		'yaegassy/coc-blade', run = 'npm install --frozen-lockfile',
		'sheerun/vim-polyglot',
		'tpope/vim-surround',
		'mattn/emmet-vim',
		'karb94/neoscroll.nvim',
		'tpope/vim-sensible',
		'windwp/nvim-ts-autotag',
		'mg979/vim-visual-multi', branch = 'master',
		'AndrewRadev/tagalong.vim',
		'SirVer/ultisnips',
		'mhartington/formatter.nvim',
		'dcampos/nvim-snippy',
		"akinsho/toggleterm.nvim", tag = '*', 
		"NvChad/nvim-colorizer.lua",
	}
	use {
  'rmagatti/auto-session',
  config = function()
    require("auto-session").setup {
      log_level = "error",
   	auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
	   auto_session_enable_last_session=true,
    }
  end
}
	require'hop'.setup {}
	require("which-key").setup {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	}
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
	require("trouble").setup {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	}
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


	require("lsp-colors").setup({
			Error = "#db4b4b",
			Warning = "#e0af68",
			Information = "#0db9d7",
			Hint = "#10B981"
		})
	require("bufferline").setup{
		options = {
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				local icon = level:match("error") and " " or " "
				return " " .. icon .. count
			end
		}
	}
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
	require("toggleterm").setup{
		direction='float',
		open_mapping = '<C-g>',
	}
	require('twilight').setup{}
	require('zen-mode').setup{}
	require('todo-comments').setup{}
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
	local colors = require("tokyonight.colors").setup()
	require("scrollbar").setup{
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
	}
	require('neoscroll').setup{}
	require('nvim-ts-autotag').setup{}
	require("formatter").setup{}

	require('hlslens').setup{
		build_position_cb = function(plist, _, _, _)
			require("scrollbar.handlers.search").handler.show(plist.start_pos)
		end,
	}
	require("telescope").load_extension "file_browser"
	require("telescope").load_extension "emoji"
	require("tailwindcss-colorizer-cmp").setup{
      color_square_width = 2,
   }
	require("cmp").config.formatting = {
		format = require("tailwindcss-colorizer-cmp").formatter
	}
	require 'colorizer'.setup{
		filetypes = {
			'css',
			'javascript',
			html = { mode = 'foreground'; }
		},
	}

	-- using packer.nvim
	vim.opt.termguicolors = true
	vim.cmd([[
		augroup scrollbar_search_hide
			autocmd!
			autocmd CmdlineLeave : lua require('scrollbar.handlers.search').handler.hide()
		augroup END
			let g:user_emmet_leader_key=','
		let g:user_emmet_install_global=0
		autocmd FileType html,css,vue,blade EmmetInstall
	]])
end)
