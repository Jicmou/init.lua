local lsp = require("lsp-zero").preset({})

lsp.preset("recommended")

---@diagnostic disable-next-line: unused-local
lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
end)

-- TODO: Consider not to setup at all, since volar does decent job already.
require("lspconfig").tsserver.setup({ autostart = false })

require("lspconfig").eslint.setup({})

require("lspconfig").volar.setup({
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

require("lspconfig").jsonls.setup({
	filetypes = { "json", "jsonc" },
	provideFormatter = true,
	capabilities = capabilities,
})

-- (Optional) Configure lua language server for neovim
require("lspconfig").lua_ls.setup({
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

require("lspconfig").marksman.setup({})

lsp.setup()

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
