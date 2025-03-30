return {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  dependencies = {
    { "williamboman/mason.nvim", config = true },
    { "williamboman/mason-lspconfig.nvim", config = true },
    "hrsh7th/cmp-nvim-lsp",
    { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
    { "folke/neodev.nvim", config = true },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup()
    mason_lspconfig.setup({
      ensure_installed = { "html", "cssls", "ts_ls", "emmet_ls" },
      automatic_installation = true,
    })

    local capabilities = cmp_nvim_lsp.default_capabilities()

    local on_attach = function(client, bufnr)
      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
      local opts = { noremap = true, silent = true }

      buf_set_keymap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
      buf_set_keymap("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
      buf_set_keymap("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
      buf_set_keymap("n", "gD", "<cmd>Telescope lsp_type_definitions<CR>", opts)
      buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

      buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
      buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
      buf_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts)

      if client.name == "tsserver" then
        buf_set_keymap("n", "<leader>oi", "<cmd>lua vim.lsp.buf.code_action({ source = { organizeImports = true } })<CR>", opts)
        buf_set_keymap("n", "<leader>fi", "<cmd>lua vim.lsp.buf.code_action({ source = { fixAll = true } })<CR>", opts)
      end
    end

    mason_lspconfig.setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end,
    })
  end,
}
