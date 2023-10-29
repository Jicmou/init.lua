local lsp_zero = require("lsp-zero").preset({})
local lsp_config = require("lspconfig")

lsp_zero.preset("recommended")

---@diagnostic disable-next-line: unused-local
lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

-- TODO: Consider not to setup at all, since volar does decent job already.
lsp_config.tsserver.setup({ autostart = false })

lsp_config.eslint.setup({
	on_attach = function(client, bufnr)
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			command = "EslintFixAll",
		})
	end,
	workingDirectories = { mode = "auto" },
})

lsp_config.nginx_language_server.setup({
	filetypes = { "nginx", "authen.conf" },
})

lsp_config.cssls.setup({})

lsp_config.yamlls.setup({
	settings = {
		redhat = { telemetry = { enabled = false } },
	},
})

lsp_config.volar.setup({
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
		"vue",
	},
})

--
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lsp_config.jsonls.setup({
	filetypes = { "json", "jsonc" },
	provideFormatter = true,
	capabilities = capabilities,
})

-- (Optional) Configure lua language server for neovim
lsp_config.lua_ls.setup({
	filetypes = { "lua" },
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})

lsp_config.marksman.setup({})

lsp_config.rust_analyzer.setup({})

lsp_config.taplo.setup({})

lsp_zero.setup()

-- Make sure you setup `cmp` after lsp-zero
local cmp = require("cmp")

cmp.setup({
	-- completion = {
	--   autocomplete = false
	-- },
	mapping = {
		["<C-Space>"] = cmp.mapping.complete(),
	},
})

vim.keymap.set("n", "<leader>es", vim.cmd.EslintFixAll, {})
