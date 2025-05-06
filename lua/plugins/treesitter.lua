-- Customize Treesitter

---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Add blade to the list of installed parsers
      vim.list_extend(opts.ensure_installed, {
        "lua",
        "vim",
        "blade",
      })

      -- Disable treesitter highlighting for blade
      opts.highlight = opts.highlight or {}
      opts.highlight.enable = true
      opts.highlight.disable = opts.highlight.disable or {}
      table.insert(opts.highlight.disable, "blade")
    end,
  },
  {
    -- Add custom Blade parser
    "EmranMR/tree-sitter-blade",
    config = function()
      require("nvim-treesitter.parsers").get_parser_configs().blade = {
        install_info = {
          url = "https://github.com/EmranMR/tree-sitter-blade",
          files = { "src/parser.c" },
          branch = "main",
        },
        filetype = "blade",
      }
    end,
  },
}

