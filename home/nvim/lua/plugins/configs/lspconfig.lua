return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local servers = {
      lua_ls = {},
      pyright = {},
      ts_ls = {},
      clangd = {},
      html = {},
      nixd = {},
    }

    for server, opts in pairs(servers) do
      opts.capabilities = capabilities
      vim.lsp.config(server, opts)
      vim.lsp.enable(server)
    end

    -- Diagnostics style
    vim.diagnostic.config({
      virtual_text = { prefix = "●" },
      signs = true,
      underline = true,
      update_in_insert = false,
      float = { border = "rounded" },
    })
  end,
}
