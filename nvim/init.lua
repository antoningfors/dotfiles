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
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		-- tag = "*",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
		  require("neorg").setup {
			load = {
			  ["core.defaults"] = {}, -- Loads default behaviour
			  ["core.concealer"] = {}, -- Adds pretty icons to your documents
			  ["core.dirman"] = { -- Manages Neorg workspaces
				config = {
				  workspaces = {
					notes = "~/notes",
				  },
				},
			  },
			},
		  }
		end,
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
			ensure_installed = { "c", "cpp", "zig", "lua", "vim", "vimdoc", "javascript" },

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,

			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = false,

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

--Open VIMRC
vim.keymap.set('n', '<leader>e', ':e $MYVIMRC<CR>', { noremap = true, silent = true })

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

vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = {"lua", "*.lua"},
  callback = function(ev)
	  vim.opt_local.makeprg = 'luafile %'
  end
})

-- Function to compile the C project
function compile_project()
  -- Save the current window layout
  local cur_win = vim.api.nvim_get_current_win()
  local windows = vim.api.nvim_tabpage_list_wins(0)

  -- Check if there are two windows open
  if #windows < 2 then
    print("Please open a vertical split with the source code in both panes.")
    return
  end

  -- Assume the current window is the left one and the other is the right one
  local right_win = windows[1] == cur_win and windows[2] or windows[1]

  -- Save the buffer number of the right window
  local right_buf = vim.api.nvim_win_get_buf(right_win)

  -- Change to the right window and run the compilation command
  vim.api.nvim_set_current_win(right_win)
  
  -- Change this command to match your compilation command
  vim.cmd("term powershell -ExecutionPolicy Bypass -File build.ps1")

  -- After the compilation is done, wait for the user to press a key to restore the source code
  vim.cmd("nnoremap <buffer> <silent> <CR> :lua restore_window(" .. cur_win .. ", " .. right_win .. ", " .. right_buf .. ")<CR>")

  -- Change back to the left window
  --vim.api.nvim_set_current_win(cur_win)
end

-- Function to restore the right window with the original buffer
function restore_window(cur_win, win, buf)
  vim.api.nvim_win_set_buf(win, buf)
  vim.api.nvim_set_current_win(cur_win)
end

-- Create a keybinding for the compile_project function
vim.api.nvim_set_keymap('n', '<C-b>', ':lua compile_project()<CR>', { noremap = true, silent = true })



-- Function to reload init.lua
function reload_config()
  -- Clear the package cache
  for name,_ in pairs(package.loaded) do
    -- Match all loaded packages (adjust the pattern if needed to be more specific)
    if name:match('^.*') then
      package.loaded[name] = nil
    end
  end
  -- Reload the init.lua file
  dofile(vim.fn.stdpath('config') .. '/init.lua')
end

-- Create a keybinding for reloading init.lua
vim.api.nvim_set_keymap('n', '<leader>r', ':lua reload_config()<CR>', { noremap = true, silent = true })


