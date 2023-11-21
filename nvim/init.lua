local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

plugins = {
	{
		enabled = true,
		"rose-pine/neovim", 
		name = "rose-pine",
		lazy = false, 
		priority = 1000,
		config = function() vim.cmd([[colorscheme rose-pine]]) end,
	},	
	{
		enabled = true,
		"dstein64/vim-startuptime", 
		name = "startuptime",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
	},
	{
		enabled = true,
		dependencies = { "nvim-treesitter/playground" },
		"nvim-treesitter/nvim-treesitter",
		name = "treesitter",
		lazy = false,
		run = ":TSUpdate",
		main = "nvim-treesitter.configs",
		config = {
			-- A list of parser names always be installed)
			ensure_installed = { "c", "zig", "lua", "vim", "vimdoc", "javascript" },

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,

			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = true,

			-- List of parsers to ignore installing (for "all")
			--ignore_install = { "javascript" },

			---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
			-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

			highlight = {
				enable = true,

				-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
				-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
				-- the name of the parser)
				-- list of language that will be disabled
				--disable = { "c", "rust" },
				-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
				disable = function(lang, buf)
					local max_filesize = 100 * 1024 -- 100 KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
				end,

				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
				-- Using this option may slow down your editor, and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages
				additional_vim_regex_highlighting = false,
			},		

			playground = {
				enable = true,
				disable = {},
				updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
				persist_queries = false, -- Whether the query persists across vim sessions
				keybindings = {
					toggle_query_editor = 'o',
					toggle_hl_groups = 'i',
					toggle_injected_languages = 't',
					toggle_anonymous_nodes = 'a',
					toggle_language_display = 'I',
					focus_language = 'f',
					unfocus_language = 'F',
					update = 'R',
					goto_node = '<cr>',
					show_help = '?',
				},
			},
		}
	},
		{
		enabled = true,
		"ThePrimeagen/vim-be-good",
		name = "vim-be-good",
		lazy = false,
	},
	{
		enabled = false,
		"ThePrimeagen/harpoon",
		name = "harpoon",
		lazy = false,
		dependencies = {"nvim-lua/plenary.nvim"},
	},
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		dependencies = { 'nvim-lua/plenary.nvim' }
	}
}

require("lazy").setup(plugins, opts)

local opt = vim.opt
vim.g.mapleader = ' ' 
opt.number = true
opt.relativenumber = false 
opt.cursorline = true
-- opt.clipboard = unamed
opt.shiftwidth=4			-- Make autoindentation four spaces
opt.tabstop=4				-- Make your tabs as wide as four spaces
opt.termguicolors = true

vim.api.nvim_set_keymap('n', '<Leader>ls', ':Ex<CR>', { noremap = true, silent = true })

--vim.api.nvim_set_keymap('n', '<Leader>h', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<Leader>a', ':lua require("harpoon.mark").add_file()<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<Leader>hd', ':lua require("harpoon.mark").rm_file()<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<Leader>hn', ':lua require("harpoon.ui").nav_next()<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<Leader>hp', ':lua require("harpoon.ui").nav_prev()<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<Leader>hc', ':lua require("harpoon.mark").clear_all()<CR>', { noremap = true, silent = true })


--vim.api.nvim_set_keymap('n', "<Leader>j", ':lua require("harpoon.ui").nav_file(1)<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', "<Leader>k", ':lua require("harpoon.ui").nav_file(2)<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', "<Leader>l", ':lua require("harpoon.ui").nav_file(3)<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', "<Leader>;", ':lua require("harpoon.ui").nav_file(4)<CR>', { noremap = true, silent = true })

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

--Build command
vim.keymap.set('n', '<C-b>', ':make<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<M-m>', ':make<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>m', ':make<CR>', { noremap = true, silent = true })

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.powershell = {
  install_info = {
    url = "~/projects/tree-sitter-powershell", -- local path or git repo
    files = {"src/parser.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
    -- optional entries:
--    branch = "main", -- default branch in case of git repo if different from master
--    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
--    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
  },
  filetype = "ps1", -- if filetype does not match the parser name
}
