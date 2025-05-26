return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			-- local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
			-- for type, icon in pairs(signs) do
			-- 	local hl = "DiagnosticSign" .. type
			-- 	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			-- end
			--
			-- -- Configure clangd with diagnostic settings
			-- lspconfig.clangd.setup({
			-- 	capabilities = capabilities,
			-- 	cmd = {
			-- 		"clangd",
			-- 		"--header-insertion=never", -- Disables header insertion
			-- 		"--completion-style=detailed",
			-- 		"--function-arg-placeholders",
			-- 	},
			-- 	init_options = {
			-- 		-- Adjust which diagnostics to show
			-- 		clangdFileStatus = true,
			-- 		usePlaceholders = true,
			-- 		completeUnimported = true,
			-- 		diagnosticProvider = "1", -- Set to "0" to completely disable diagnostics
			-- 	},
			-- 	handlers = {
			-- 		["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			-- 			-- Customize diagnostic display
			-- 			virtual_text = {
			-- 				severity = { min = vim.diagnostic.severity.ERROR }, -- Only show errors, not warnings
			-- 			},
			-- 			signs = true,
			-- 			underline = true,
			-- 			update_in_insert = false,
			-- 		}),
			-- 	},
			-- })

			-- Setup for other language servers
			lspconfig.clangd.setup({ capabilities = capabilities })
			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.ts_ls.setup({ capabilities = capabilities })
			lspconfig.tailwindcss.setup({ capabilities = capabilities })
			lspconfig.html.setup({ capabilities = capabilities })
			lspconfig.ast_grep.setup({ capabilities = capabilities })

			-- Key mappings
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })

			-- Global diagnostic configuration
			vim.diagnostic.config({
				virtual_text = {
					severity = { min = vim.diagnostic.severity.ERROR }, -- Only show errors as virtual text
				},
				float = {
					source = "always", -- Show source in float window
				},
				severity_sort = true,
			})
		end,
	},
}
