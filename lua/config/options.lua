local options = {
  backup = false,            -- creates a backup file
  clipboard = 'unnamedplus', -- allow neovim to access the system clipboard
  fileencoding = 'utf-8',    -- the encoding written to a file
  hlsearch = true,           -- highlight all matches on previous search pattern
  expandtab = true,          -- convert tabs to spaces
  shiftwidth = 2,            -- the number of spacess inserted for each indentation
  tabstop = 2,               -- insert 2 spaces for a tab
  number = true,             -- set numbered lines
  relativenumber = true,     -- set relative numbered lines
  numberwidth = 4,           -- set number column width to 4 {default: 4}
  signcolumn = 'yes',        -- always show the sign column, otherwise it would shift the text each time
  wrap = false,              -- display lines as one long line
  scrolloff = 8,
  sidescrolloff = 8,
  foldmethod = "indent",
  foldlevel = 2,
  listchars = { tab = " ", space = ".", eol = "" },
  list = true,
  termguicolors = true,
  background = "dark"
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
