return {
  {
    "mason-org/mason.nvim",
    opts = {},
    config = function()
      require("mason").setup()
    end
  },
  {
    "mason-org/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ---@type string[]
        ensure_installed = { "lua_ls", "ts_ls", "html" },
        ---@type boolean | string[] | { exclude: string[] }
        automatic_enable = true,
      })
    end,
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require("lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local capabilities = cmp_nvim_lsp.default_capabilities()
      -- Lua
      lspconfig.lua_ls.setup({ capabilities = capabilities })
      -- TypeScript / JavaScript
      lspconfig.ts_ls.setup({})

      -- TypeScript / TSX / JavaScript / JSX
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
        root_dir = lspconfig.util.root_pattern("tsconfig.json", "jsconfig.json", "package.json", ".git"),
        })

      -- HTML (for .html files, Emmet completions, etc.)
      lspconfig.html.setup({ capabilities = capabilities })

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      -- Show diagnostics in a floating window
      -- Use <leader>e to toggle diagnostics
      -- vim.keymap.set("n", "<leader>e", function()
      --   vim.diagnostic.open_float({ focusable = false, scope = "line" })
      -- end, { desc = "Show Diagnostics" })
      -- vim.diagnostic.config({
      --   virtual_text = false,
      --   signs = true,
      --   underline = true,
      --   update_in_insert = false,
      --   severity_sort = true,
      -- })
      
      -- Toggle inline diagnostics (virtual text) with <leader>e
      local show_virtual_text = true  -- Start with virtual text enabled

      vim.keymap.set("n", "<leader>e", function()
        show_virtual_text = not show_virtual_text  -- Toggle state
        vim.diagnostic.config({
          virtual_text = show_virtual_text,
          -- Preserve other diagnostic settings
          signs = true,
          underline = true,
          update_in_insert = false,
          severity_sort = true,
        })
      end, { desc = "Toggle inline diagnostics" })

      local signs = { Error = "✘", Warn = "▲", Hint = "⚑", Info = "" }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end
    end
  }
}

