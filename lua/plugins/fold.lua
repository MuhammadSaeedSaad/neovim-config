-- ~/.config/nvim/lua/plugins/fold.lua
return {
  "kevinhwang91/nvim-ufo",
  dependencies = "kevinhwang91/promise-async",
  event = "BufReadPost",
  init = function()
    -- Disable folding in specific filetypes
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "neo-tree", "neo-tree-popup", "Trouble", "qf", "help",
        "lspinfo", "man", "dashboard", "NvimTree", "toggleterm"
      },
      callback = function()
        vim.wo.foldenable = false
        vim.wo.foldcolumn = "0"  -- Hide fold column
      end
    })
  end,
  config = function()
    -- Set basic folding options
    vim.opt.foldcolumn = "1"    -- Show fold column
    vim.opt.foldlevel = 99      -- Open most folds by default
    vim.opt.foldlevelstart = 99 -- Expand folds when opening files
    vim.opt.foldenable = true

    -- Configure ufo
    require("ufo").setup({
      provider_selector = function(bufnr, filetype, buftype)
        -- Disable folding for special buffers
        if vim.tbl_contains({
            "neo-tree", "neo-tree-popup", "Trouble", "qf", "help",
            "lspinfo", "man", "dashboard", "NvimTree", "toggleterm"
          }, filetype) then
          return ""
        end
        return { "treesitter", "indent" }  -- Priority: treesitter > indent
      end,
      close_fold_kinds = {"imports"},
      preview = {
        win_config = {
          border = "rounded",
          winhighlight = "Normal:Folded",
          winblend = 0
        },
        mappings = {
          scrollU = "<C-u>",
          scrollD = "<C-d>"
        }
      },
      fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local suffix = (" 󰁂 %d "):format(endLnum - lnum)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0
        for _, chunk in ipairs(virtText) do
          local chunkText = chunk[1]
          local chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
          else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, {chunkText, hlGroup})
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            if curWidth + chunkWidth < targetWidth then
              suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
            end
            break
          end
          curWidth = curWidth + chunkWidth
        end
        table.insert(newVirtText, {suffix, "MoreMsg"})
        return newVirtText
      end
    })

    -- Key mappings
    vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
    vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })
    vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds, { desc = "Open folds except kinds" })
    vim.keymap.set("n", "zm", require("ufo").closeFoldsWith, { desc = "Close folds with level" })
    vim.keymap.set("n", "zp", function()
      local winid = require("ufo").peekFoldedLinesUnderCursor()
      if not winid then
        vim.lsp.buf.hover()
      end
    end, { desc = "Peek fold" })
  end
}
