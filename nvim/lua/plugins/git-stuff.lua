return {
	{ "tpope/vim-fugitive" },
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "_" },
					topdelete = { text = "-" },
					changedelete = { text = "~" },
				},
			})

			vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
			vim.keymap.set(
				"n",
				"<leader>tb",
				":Gitsigns toggle_current_line_blame<CR>",
				{ desc = "[T]oggle [B]lame for current line" }
			)
		end,
	},
}
