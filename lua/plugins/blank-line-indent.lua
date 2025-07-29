return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    indent = { char = "│" }, -- vertical line character
    scope = {
      enabled = true,        -- highlights nested blocks
      show_start = false,
      show_end = false,
      highlight = { "Function", "Label", "Keyword", "String", "Number", "Comment" },
    },
    exclude = {
      filetypes = { "help", "terminal", "dashboard", "lazy" },
    },
  }
}


