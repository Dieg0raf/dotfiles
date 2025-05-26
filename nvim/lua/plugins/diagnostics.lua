return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- -- Configure diagnostic signs
      vim.fn.sign_define("DiagnosticSignError", { text = "▬", texthl = "DiagnosticSignError" })
      vim.fn.sign_define("DiagnosticSignWarn", { text = "▬", texthl = "DiagnosticSignWarn" })
      vim.fn.sign_define("DiagnosticSignInfo", { text = "▬", texthl = "DiagnosticSignInfo" })
      vim.fn.sign_define("DiagnosticSignHint", { text = "▬", texthl = "DiagnosticSignHint" })

      -- Configure diagnostic highlights with undercurls
      vim.cmd([[
			  highlight DiagnosticUnderlineError guisp=#ff0000 gui=undercurl cterm=undercurl
			  highlight DiagnosticUnderlineWarn guisp=#ffae00 gui=undercurl cterm=undercurl
			  highlight DiagnosticUnderlineInfo guisp=#00ff00 gui=undercurl cterm=undercurl
			  highlight DiagnosticUnderlineHint guisp=#0000ff gui=undercurl cterm=undercurl
			]])
      -- Configure diagnostics display
      vim.diagnostic.config({
        signs = true,
        underline = {
          severity = { min = vim.diagnostic.severity.WARN }, -- Only for warnings and errors
          range = true,
        },
        update_in_insert = false,
        severity_sort = true,
      })
      -- vim.diagnostic.config({
      --   virtual_text = { spacing = 4, prefix = "●" },
      --   signs = true,
      --   underline = true,
      --   update_in_insert = false,
      --   severity_sort = true,
      --   float = {
      --     border = "rounded",
      --     source = "always",
      --     header = "",
      --     prefix = "",
      --   },
      -- })

      -- Keymaps for diagnostic navigation and floating windows
      vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open diagnostic float" })
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
      vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Set location list for diagnostics" })
    end,
  },
  -- Optional: Add Trouble.nvim for better error list view
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup({
        -- your configuration comes here
      })
    end,
  },
}
