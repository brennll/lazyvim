return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      flow = {
        cmd = { "npx", "flow", "lsp" }, -- Menjalankan Flow sebagai LSP
        filetypes = { "javascript", "javascriptreact" }, -- Aktif di file JS/JSX
        root_dir = require("lspconfig").util.root_pattern(".flowconfig"), -- Hanya aktif jika ada .flowconfig
        settings = {},
      },

      vtsls = {
        enabled = function()
          local flow_dir = vim.fn.glob(vim.fn.getcwd() .. "/.flowconfig")
          print(flow_dir)
          return flow_dir == ""
        end,
        filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
        root_dir = require("lspconfig").util.root_pattern("package.json", "tsconfig.json"),
      },
    },
  },
}
