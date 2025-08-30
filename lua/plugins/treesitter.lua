return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "javascript", "typescript", "html", "tsx", },
      auto_install = true,  -- automatically install missing parsers
      sync_install = false, -- install parsers synchronously (only applied to `ensure_installed`)
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
