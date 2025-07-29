return {
  "lewis6991/gitsigns.nvim",
  config = function ()
   require("gitsigns").setup()

    vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Preview Hunk" })
    vim.keymap.set("n", "<leader>rh", ":Gitsigns reset_hunk<CR>", { desc = "Reset Hunk" })
    vim.keymap.set("n", "<leader>sh", ":Gitsigns stage_hunk<CR>", { desc = "Stage Hunk" })
    vim.keymap.set("n", "<leader>uh", ":Gitsigns undo_stage_hunk<CR>", { desc = "Undo Stage Hunk" })
    vim.keymap.set("n", "<leader>gb", ":Gitsigns blame_line<CR>", { desc = "Blame Line" })
    vim.keymap.set("n", "<leader>gd", ":Gitsigns diffthis<CR>", { desc = "Diff This" })
    vim.keymap.set("n", "<leader>gD", ":Gitsigns diffthis HEAD<CR>", { desc = "Diff This HEAD" })
    vim.keymap.set("n", "<leader>gS", ":Gitsigns stage_buffer<CR>", { desc = "Stage Buffer" })
    vim.keymap.set("n", "<leader>gR", ":Gitsigns reset_buffer<CR>", { desc = "Reset Buffer" })
    vim.keymap.set("n", "<leader>gU", ":Gitsigns reset_buffer_index<CR>", { desc = "Reset Buffer Index" })
    vim.keymap.set("n", "<leader>gL", ":Gitsigns setqflist<CR>", { desc = "Set QF List" })
    vim.keymap.set("n", "<leader>gC", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle Current Line Blame" })
    vim.keymap.set("n", "<leader>gT", ":Gitsigns toggle_deleted<CR>", { desc = "Toggle Deleted" })
    vim.keymap.set("n", "<leader>gP", ":Gitsigns preview_hunk<CR>", { desc = "Preview Hunk" })
    vim.keymap.set("n", "<leader>gN", ":Gitsigns next_hunk<CR>", { desc = "Next Hunk" })
    vim.keymap.set("n", "<leader>gH", ":Gitsigns reset_head<CR>", { desc = "Reset Head" })
    vim.keymap.set("n", "<leader>gF", ":Gitsigns toggle_signs<CR>", { desc = "Toggle Signs" })
    vim.keymap.set("n", "<leader>gA", ":Gitsigns toggle_numhl<CR>", { desc = "Toggle Num Highlight" })
    vim.keymap.set("n", "<leader>gO", ":Gitsigns toggle_linehl<CR>", { desc = "Toggle Line Highlight" })
    vim.keymap.set("n", "<leader>gX", ":Gitsigns toggle_word_diff<CR>", { desc = "Toggle Word Diff" })
    vim.keymap.set("n", "<leader>gB", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle Current Line Blame" })
  end
}
