local lint = require("lint")

lint.linters_by_ft = {
	vue = { "eslint", "stylelint" },
	typescript = { "eslint" },
	javascript = { "eslint" },
	css = { "stylelint" },
	scss = { "stylelint" },
}

vim.api.nvim_create_autocmd({ "InsertLeave" }, {
	callback = function()
		lint.try_lint()
	end,
})
