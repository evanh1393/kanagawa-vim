return {
  "rebelot/kanagawa.nvim",
  name = "kanagawa",
  lazy = false,
  priority = 1000,
  opts = {
    theme = "dragon", -- Options: "wave", "dragon", "lotus"
    transparent = true,
  },
  config = function(_, opts) require("kanagawa").setup(opts) end,
}
