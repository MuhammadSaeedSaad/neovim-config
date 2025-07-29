return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && npm install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  config = function()
    vim.g.mkdp_port = '8088'
    vim.g.mkdp_browser = 'firefox'  -- or 'chrome', explicit browser
    vim.g.mkdp_auto_start = false   -- Ensure this isn't true
    vim.g.mkdp_auto_close = true
    vim.g.mkdp_browser = '/usr/bin/firefox'  -- Full path to binary
  end,
  ft = { "markdown" },
}
