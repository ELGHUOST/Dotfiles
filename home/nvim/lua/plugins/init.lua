-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  "alpha",
  "tokyonight",
  "lualine",
  "treesitter",
  "telescope",
  "neo-tree",
  "mason",
  "mason-lspconfig",
  "lspconfig",
  "cmp",
  "autopairs",
  "gitsigns",
  "indent-blankline",
  "which-key",
  "bufferline",
  "comment",
}

local specs = {}
for _, name in ipairs(plugins) do
  local ok, spec = pcall(require, "plugins.configs." .. name)
  if ok then table.insert(specs, spec) end
end

require("lazy").setup(specs, {
  ui = { border = "rounded" },
  performance = {
    rtp = { disabled_plugins = { "gzip", "tarPlugin", "tohtml", "tutor", "zipPlugin" } },
  },
})
