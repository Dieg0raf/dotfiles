return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			close_if_last_window = false,
			reveal_force_cwd = true, -- always reveal the current working directory
			window = {
				width = 40,
				position = "right",
				-- popup_border_style = "rounded",
				-- use_popups_for_input = true,
				-- retain_hidden_root_indent = true,
			},
			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
					hide_gitignored = false,
				},
				hijack_netrw_behavior = "disabled",
			},
			buffers = {
				follow_current_file = {
					enabled = true,
					leave_dirs_open = true,
				},
			},
		})

		vim.keymap.set("n", "<leader>ne", ":Neotree filesystem reveal right<CR>", {})
		vim.keymap.set("n", "<leader>b", ":Neotree filesystem toggle right<CR>", {})
	end,
}
