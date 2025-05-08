return {
  -- Emmet for Blade support
  {
    "mattn/emmet-vim",
    ft = { "html", "css", "javascriptreact", "typescriptreact", "vue", "svelte", "blade" },
    config = function()
      -- Disable global Emmet installation
      vim.g.user_emmet_install_global = 0

      -- Explicitly set the filetype for Blade files to HTML in Emmet settings
      vim.g.user_emmet_settings = {
        html = {
          ["blade"] = "html",
        },
      }

      -- Ensure Emmet is activated for Blade files
      vim.cmd [[
        autocmd FileType blade EmmetInstall
      ]]

      -- Set the Emmet leader key to Ctrl+Z
      vim.g.user_emmet_leader_key = "<C-Z>"

      -- Map the expansion trigger for Blade specifically
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "blade",
        callback = function()
          vim.bo.filetype = "blade"
          -- Bind Emmet expand key specifically for Blade
          vim.api.nvim_buf_set_keymap(0, "i", "<C-Z>", "<Plug>(emmet-expand-abbr)", { noremap = true, silent = true })
        end,
      })
    end,
  },

  -- Blade syntax highlighting
  {
    "jwalton512/vim-blade",
    ft = { "blade" },
    config = function()
      -- Set filetype for Blade templates explicitly
      vim.cmd [[
        autocmd BufNewFile,BufRead *.blade.php set filetype=blade
      ]]
    end,
  },
}
