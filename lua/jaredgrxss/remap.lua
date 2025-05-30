vim.g.mapleader = " "
-- File explorer
vim.keymap.set("n", "<leader>pv", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
-- Locate current file in tree
vim.keymap.set("n", "<leader>pp", ":NvimTreeFindFile<CR>", { desc = "Find current file in tree" })
-- ============================================================================
-- nvim-tree keybinding cheatsheet (inside the tree window)
-- ============================================================================
-- a       Create a new file or folder (append / to make folder)
-- d       Delete selected file or folder
-- r       Rename file or folder
-- x       Cut file or folder
-- y       Copy file or folder
-- p       Paste into directory
-- m       Move (rename path)
-- c       Copy name or path to clipboard
-- gh      Toggle hidden files (dotfiles)
-- R       Refresh the tree
-- ]c / [c Navigate to next/prev Git change
-- ?       Toggle help popup inside the tree
-- ============================================================================
-- Focus the file tree
vim.keymap.set('n', '<leader>fe', function()
    require('nvim-tree.api').tree.focus()
end, { desc = 'Focus the file tree'})
-- Folding
vim.keymap.set("n", "<leader>f", "za", { desc = "Toggle fold" })
vim.keymap.set("n", "<leader>fo", "zR", { desc = "Open all folds" })
vim.keymap.set("n", "<leader>fc", "zM", { desc = "Close all folds" })
vim.opt.foldmethod = "indent"
vim.opt.foldenable = true
vim.opt.foldlevel = 99 -- Open all folds by default

-- Tip: You need to be *inside the nvim-tree window* for these to work.
-- Open a terminal vertically next to current window
vim.keymap.set("n", "<leader>vst", function()
    vim.cmd("vsplit | terminal")
end, { desc = "Split window vertically" })
-- Open another terminal
vim.keymap.set("n", "<leader>vsc", function()
    vim.cmd("vsplit | enew")
end, { desc = "Split window vertically" })
-- Exit insert mode in a terminal
vim.keymap.set('t', '<Esc>', '<Cmd>stopinsert<CR>', { desc = 'Exit insert mode in terminal' })

-- Shift to the left window
vim.keymap.set('n', '<leader>h', '<C-w>h', { desc = 'Move to left window' })

-- Shift to the bottom window 
vim.keymap.set('n', '<leader>j', '<C-w>j', { desc = 'Move to bottom window' })

-- Shift to the top window
vim.keymap.set('n', '<leader>k', '<C-w>k', { desc = 'Move to top window' })

-- Shift to the right window
vim.keymap.set('n', '<leader>l', '<C-w>l', { desc = 'Move to right window' })

-- Don't wrap lines
vim.opt.wrap = false

-- Line numbers + relative 
vim.wo.number = true
vim.opt.relativenumber = true

-- Swap file stuff 
local home = os.getenv("HOME") or os.getenv("USERPROFILE") -- Fallback to USERPROFILE on Windows
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = home .. "/.vim/undodir"
vim.opt.undofile = true

-- Good colors 
vim.opt.termguicolors = true

-- Buffer some characters at the top
vim.opt.scrolloff = 8

-- Enable virtualedit to allow moving the cursor after the word
vim.o.virtualedit = "onemore"

-- Changing default spacing
vim.o.tabstop = 4      -- Number of spaces a <Tab> counts for
vim.o.shiftwidth = 4   -- Number of spaces to use for autoindent
vim.o.softtabstop = 4  -- Number of spaces inserted when pressing Tab
vim.o.expandtab = true -- Convert tabs to spaces
-- ============================================================================
-- Additional remaps for an even smoother workflow
-- ============================================================================
-- 1. Quick exit from insert mode using "jk"
vim.keymap.set("i", "jk", "<Esc>", { desc = "Quickly exit insert mode" })

-- 2. Buffer navigation: move between buffers easily
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })

-- 3. Quick file saving and closing
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save current file" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit current buffer" })

-- 4. Window resizing without Ctrl keys
vim.keymap.set("n", "<leader>=", ":vertical resize +5<CR>", { desc = "Increase window width" })
vim.keymap.set("n", "<leader>-", ":vertical resize -5<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<leader>+", ":resize +5<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<leader>_", ":resize -5<CR>", { desc = "Decrease window height" })

-- 5. Move lines up and down (works in normal and visual mode)
vim.keymap.set("n", "<C-j>", ":m .+1<CR>==", { desc = "Move current line down" })
vim.keymap.set("n", "<C-k>", ":m .-2<CR>==", { desc = "Move current line up" })
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- 6. Clear search highlight easily
vim.keymap.set("n", "<leader>c", ":nohlsearch<CR>", { desc = "Clear search highlights" })

-- 7. Quick reload of your Vim configuration
vim.keymap.set("n", "<leader>sv", ":source $MYVIMRC<CR>", { desc = "Reload vim config" })

-- Always make nvim directory the working one 
vim.g.netrw_keepdir = 0

-- LSP Keymaps
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Find references" })
vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { desc = "Go to type definition" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
vim.keymap.set("n", "<leader>lh", vim.lsp.buf.signature_help, { desc = "Show signature help" })
vim.keymap.set("n", "<leader>lf", function()
    vim.lsp.buf.format({ async = true })
end, { desc = "Format code" })

-- Hover documentation (like VSCode hover tooltips)
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover for documentation" })
