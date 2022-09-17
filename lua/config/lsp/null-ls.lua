local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- Sources at local
local code_actions = null_ls.builtins.code_actions
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  cmd = { "nvim" },
  debug = false,
  diagnostics_format = "[#{c}] #{m} (#{s})",
  sources = {
    code_actions.gitsigns,

    formatting.rubocop,
    formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
    -- formatting.black.with({ extra_args = { "--fast" } }),
    -- formatting.stylua,

    diagnostics.rubocop,
    -- diagnostics.flake8
  },
})
