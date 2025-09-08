return {
	"olimorris/onedarkpro.nvim",
	priority = 1000, -- Ensure it loads first
	config = function()
		local color = require("onedarkpro.helpers")
		local colors = color.get_colors()

		require("onedarkpro").setup({
			highlights = {
				GitSignsAdd = { fg = colors.green },
				GitSignsAddCursorLine = { fg = colors.green },
				GitSignsChange = { fg = colors.yellow },
				GitSignsChangeCursorLine = { fg = colors.yellow },
				GitSignsDelete = { fg = colors.red },
				GitSignsDeleteCursorLine = { fg = colors.red },
				GitSignsUntracked = { fg = colors.blue },
				GitSignsUntrackedCursorLine = { fg = colors.blue },

				GitSignsAddPreview = { bg = colors.green },
				GitSignsDeletePreview = { bg = colors.red },
				GitSignsAddInline = { bg = colors.green },
				GitSignsChangeInline = { bg = colors.yellow },
				GitSignsDeleteInline = { bg = colors.red },
			},
		})
		vim.cmd("colorscheme onedark")
	end,
}
