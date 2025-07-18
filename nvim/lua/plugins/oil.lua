return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	config = function()
		require("oil").setup({
			default_file_explorer = true,
		})
	end,
	vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" }),
	-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
	-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
	lazy = false,
}
