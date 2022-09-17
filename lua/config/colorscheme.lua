vim.api.nvim_set_var("sonokai_style", "default")
vim.api.nvim_set_var("sonokai_better_performance", 1)
vim.api.nvim_set_var("sonokai_transparent_background", 0)
vim.cmd [[
  try
    colorscheme sonokai
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
  endtry
]]
