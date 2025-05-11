return {
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false, -- load during startup
    priority = 1000, -- load before other plugins
    config = function()
      -- Set the colorscheme
      vim.cmd "colorscheme cyberdream"

      -- Enable transparency
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })

      -- Optional: Adjust specific UI elements
      vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
      vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
      vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
      vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    end,
  },
}
