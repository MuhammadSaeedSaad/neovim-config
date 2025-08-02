return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    
    -- Added: Configure null-ls with formatters
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier.with({
          -- ADDED: Use project-specific config files when available
          condition = function(utils)
            return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.yaml", 
                                        ".eslintrc.yml", ".eslintrc.json", ".prettierrc", 
                                        ".prettierrc.js", ".prettierrc.json" })
          end,
          -- ADDED: Use the project root to find config files
          cwd = function(params)
            return require("null-ls.utils").root_pattern(".eslintrc", ".prettierrc")(params.bufname)
          end
        }),
      },
    })
    
    -- ADDED: Auto-format on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.lua", "*.html" },
      callback = function()
        -- Format the current buffer synchronously before saving
        vim.lsp.buf.format({ async = false })
      end,
    })

    -- Manual formatting keymap
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end
}
