local options = {
  backup = false,            -- creates a backup file
  clipboard = 'unnamedplus', -- allow neovim to access the system clipboard
  fileencoding = 'utf-8',    -- the encoding written to a file
  hlsearch = true,           -- highlight all matches on previous search pattern

  -- Decrease update time
  timeoutlen = 500,
  updatetime = 200,

  termguicolors = true,
  -- background = "dark"

  -- Better editing experience
  expandtab = true,          -- convert tabs to spaces
  smarttab = true,
  cindent = true,
  autoindent = true,
  textwidth = 300,
  shiftwidth = 2,            -- the number of spacess inserted for each indentation
  tabstop = 2,               -- insert 2 spaces for a tab
  softtabstop = -1,          -- If negative, shiftwidth value is used
  wrap = true,               -- display lines as one long line
  list = true,
  listchars = { tab = " ", space = ".", eol = "" },

  -- Better Editor UI
  number = true,             -- set numbered lines
  relativenumber = true,     -- set relative numbered lines
  numberwidth = 4,           -- set number column width to 4 {default: 4}
  signcolumn = 'yes',        -- always show the sign column, otherwise it would shift the text each time
  cursorline = true,

  -- Number of screen lines to keep above and below the cursor
  scrolloff = 8,
  sidescrolloff = 8,

  -- Better folds
  foldmethod = "indent",
  foldlevel = 2,

  -- Remember 50 items in commandline history
  history = 50,

  -- Better buffer splitting
  splitright = true,
  splitbelow = true,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
