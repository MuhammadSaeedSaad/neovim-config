return {
  {
    "Shatur/neovim-ayu",
    config = function()
      require('ayu').setup({
        mirage = false,  -- Use mirage background for floats
        overrides = {}, -- Custom highlight overrides
      })

      -- Set color scheme
      -- vim.cmd.colorscheme('ayu')
    end,
  },
  {
    "catppuccin/nvim", name = "catppuccin", priority = 1000,
    config = function()
      require("catppuccin").setup({
        term_colors = true,
        -- style = "mocha", -- or "latte", "frappe", "macchiato"
        -- transparent_background = true
      })
      vim.cmd.colorscheme "catppuccin"
    end

  },
  {
    "folke/tokyonight.nvim",
    -- lazy = false,
    -- priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",  -- or "night", "storm", "day"
        transparent = true, -- if you want transparent background
      })
      -- vim.cmd.colorscheme("tokyonight")
    end
  },
  {
    "rebelot/kanagawa.nvim",
    -- lazy = false,
    -- priority = 1000,
    -- config = function()
    --   require("kanagawa").setup({
    --     transparent = true, -- if you want transparent background
    --   })
    --   -- vim.cmd.colorscheme("kanagawa")
    -- end
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    -- lazy = false,
    -- priority = 1000,
    -- config = function()
    --   require("rose-pine").setup({
    --     variant = "auto", -- or "dawn", "moon"
    --     transparent = true, -- if you want transparent background
    --   })
    --   -- vim.cmd.colorscheme("rose-pine")
    -- end
  },
  {
    "navarasu/onedark.nvim",
    -- lazy = false,
    -- priority = 1000,
    config = function()
      require("onedark").setup({
        style = "deep", -- or "deep", "cool", "warm", "warmer", "light"
        transparent = true, -- if you want transparent background
      })
      -- vim.cmd.colorscheme("onedark")
    end
  },
  {
    "EdenEast/nightfox.nvim",
    -- lazy = false,
    -- priority = 1000,
    -- config = function()
    --   require("nightfox").setup({
    --     options = {
    --       transparent = true, -- if you want transparent background
    --     },
    --   })
    --   -- vim.cmd.colorscheme("nightfox")
    -- end
  },
  {
    "sainnhe/everforest",
    -- lazy = false,
    -- priority = 1000,
    -- config = function()
    --   require("everforest").setup({
    --     transparent_background = true, -- if you want transparent background
    --   })
    --   -- vim.cmd.colorscheme("everforest")
    -- end
  },
}
