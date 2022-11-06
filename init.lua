vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true

guicursor = 'i:ver10'
syntax = on
wrap = true
vim.o.tabstop = 3
vim.o.shiftwidth = 3
expandtab = on
vim.o.breakindent = on

-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = " "
map('n','<Leader>q',':q<CR>')
map('n','<Leader>w',':w<CR>')
map('n','<Leader>s',':HopChar2<CR>')
map('n','<Leader>l','<cmd>lua _lazygit_toggle()<CR>')
map('n','<Leader>m',':call CocAction("format")<CR>')
map('n','<Leader>ps',':PackerSync<CR>')
map('n','<Leader>pi',':PackerInstall<CR>')

map('n','<Leader>ff',':Telescope find_files<CR>')
map('n','<Leader>fg',':Telescope live_grep<CR>')
map('n','<Leader>fb',':Telescope file_browser<CR>')
map('n','<Leader>fB',':Telescope buffers<CR>')
map('n','<Leader>fh',':Telescope help_tag<CR>')
map('n','<Leader>fe',':Telescope emoji<CR>')
map('n','<Leader>1','1gt')
map('n','<Leader>2','2gt')
map('n','<Leader>3','3gt')
map('n','<Leader>4','4gt')
map('n','<Leader>5','5gt')
map('n','<Leader>6','6gt')
map('n','<Leader>7','7gt')
map('n','<Leader>8','8gt')
map('n','<Leader>9','9gt')
map('n','<Leader>0',':tablast<CR>')

map('i','jk','<ESC>', { noremap = true})
map('i','<C-h>','<Left>')
map('i','<C-j>','<Down>')
map('i','<C-k>','<Up>')
map('i','<C-l>','<Right>')
map('i','<C-o>','<esc>o')

require('packer-plugins') 

vim.cmd([[
	autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\   exe "normal! g`\"" |
	\ endif

	highlight LineNr guifg=#565f89 guibg=NONE
	highlight CursorLineNr guifg=#7aa2f7 guibg=NONE
]])

