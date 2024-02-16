-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require("lspconfig")["lua_ls"].setup({
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
		},
	},
})

require("lspconfig")["tsserver"].setup({
	capabilities = capabilities,
})

require("lspconfig")["svelte"].setup({
	capabilities = capabilities,
})

require("lspconfig")["emmet_ls"].setup({ capabilities = capabilities, filetypes = { "scss" } })

require("lspconfig")["eslint"].setup({
	capabilities = capabilities,
})

return {}
