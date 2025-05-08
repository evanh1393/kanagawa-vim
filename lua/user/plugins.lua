return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        intelephense = {},
        gopls = {},
        emmet_ls = {
          filetypes = {
            "html",
            "css",
            "javascriptreact",
            "typescriptreact",
            "vue",
            "svelte",
            "edge",
            "blade",
          },
          init_options = {
            html = {
              options = {
                ["bem.enabled"] = true,
              },
            },
          },
        },
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local null_ls = require "null-ls"

      null_ls.setup {
        sources = {
          -- Use only Prettier for formatting JS and JSX files
          null_ls.builtins.formatting.prettier.with {
            filetypes = { "javascript", "javascriptreact", "jsx", "html", "astro" },
          },
        },
        on_attach = function(client, bufnr)
          if client.supports_method "textDocument/formatting" then
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              callback = function() vim.lsp.buf.format { bufnr = bufnr } end,
            })
          end
        end,
      }
    end,
  },
  {
    "mattn/emmet-vim",
    ft = { "html", "css", "javascriptreact", "typescriptreact", "vue", "svelte", "blade" },
    config = function()
      -- Disable global installation of Emmet
      vim.g.user_emmet_install_global = 0

      -- Install Emmet specifically for Blade and other supported file types
      vim.cmd [[
        autocmd FileType html,css,javascriptreact,typescriptreact,vue,svelte,blade EmmetInstall
      ]]

      -- Set the Emmet leader key to Ctrl+Z
      vim.g.user_emmet_leader_key = "<C-Z>"

      -- Ensure that the filetype is correctly set as 'blade' when opening .blade.php files
      vim.api.nvim_create_autocmd("BufRead,BufNewFile", {
        pattern = "*.blade.php",
        callback = function() vim.bo.filetype = "blade" end,
      })
    end,
  },
  {
    "jwalton512/vim-blade",
    ft = { "blade" },
  },
}
