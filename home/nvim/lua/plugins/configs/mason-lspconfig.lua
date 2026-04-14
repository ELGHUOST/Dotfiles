return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = { "williamboman/mason.nvim" },
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "pyright",
        "ts_ls",
        "clangd",
        "html",
        -- nixd est installé via NixOS, pas Mason
      },
      automatic_installation = true,
    })
  end,
}
