return {
  {
    "github/copilot.vim",
    -- Remove any lazy-loading conditions to ensure it loads immediately
    lazy = false,
    priority = 1000, -- Give it high priority to load early
    config = function()
      -- Disable the default tab completion
      vim.g.copilot_no_tab_map = true

      -- Set explicit keymaps for accepting suggestions
      vim.api.nvim_set_keymap("i", "<C-y>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

      -- Dismiss suggestions
      vim.api.nvim_set_keymap("i", "<C-l>", "copilot#Dismiss()", { silent = true, expr = true })
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    build = "make tiktoken",    -- Only on MacOS or Linux
    opts = {
      debug = false,            -- Enable debugging
      -- See Configuration section for rest
      question_header = "## Diego ",
      answer_header = "## Copilot ",
      error_header = "## Error ",
      show_help = true,
    },
    keys = {
      { "<leader>zc", ":CopilotChat<CR>",         mode = "n", desc = "Chat with Copilot" },
      { "<leader>ze", ":CopilotChatExplain<CR>",  mode = "v", desc = "Explain Code" },
      { "<leader>zr", ":CopilotChatReview<CR>",   mode = "v", desc = "Review Code" },
      { "<leader>zf", ":CopilotChatFix<CR>",      mode = "v", desc = "Fix Code Issues" },
      { "<leader>zo", ":CopilotChatOptimize<CR>", mode = "v", desc = "Optimize Code" },
      { "<leader>zd", ":CopilotChatDocs<CR>",     mode = "v", desc = "Generate Docs" },
      { "<leader>zt", ":CopilotChatTests<CR>",    mode = "v", desc = "Generate Tests" },
      { "<leader>zm", ":CopilotChatCommit<CR>",   mode = "n", desc = "Generate Commit Message" },
      { "<leader>zs", ":CopilotChatCommit<CR>",   mode = "v", desc = "Generate Commit for Selection" },
    },
  },
}
