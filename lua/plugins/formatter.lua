-- Utilities for creating configurations
local util = require("formatter.util")

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		-- Formatter configurations for filetype "lua" go here
		-- and will be executed in order
		lua = {
			-- "formatter.filetypes.lua" defines default configurations for the
			-- "lua" filetype
			require("formatter.filetypes.lua").stylua,
		},

		typescript = {
			-- require("formatter.filetypes.typescript").prettier,
			require("formatter.filetypes.typescript").eslint_d,
			function()
				return {
					exe = "./node_modules/.bin/prettier",
					args = { "--stdin-filepath", util.get_current_buffer_file_path() },
					stdin = true,
				}
			end,
		},

		typescriptreact = {
			require("formatter.filetypes.typescriptreact").prettier,
			require("formatter.filetypes.typescriptreact").eslint_d,
		},

		svelte = {
			require("formatter.filetypes.svelte").prettier,
			require("formatter.filetypes.svelte").eslint_d,
		},

		-- Use the special "*" filetype for defining formatter configurations on
		-- any filetype
		["*"] = {
			-- "formatter.filetypes.any" defines default configurations for any
			-- filetype
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

return {}
