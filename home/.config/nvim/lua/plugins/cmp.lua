local cmp = require('cmp')
local lspkind = require('lspkind')

local source_mapping = {
	buffer = '[Buffer]',
	nvim_lsp = '[LSP]',
	nvim_lua = '[Lua]',
	path = '[Path]',
}

cmp.setup({
	window = {
		completition = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered()
	},
	mapping = cmp.mapping.preset.insert({
		['<C-y>'] = cmp.mapping.confirm({ select = true }),
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-u>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
	}),
	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = lspkind.presets.default[vim_item.kind]
			local menu = source_mapping[entry.source.name]
			vim_item.menu = menu
			return vim_item
		end
	},
	snippet = {
		expand = function(args)
			require 'luasnip'.lsp_expand(args.body)
		end
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
	}, {
		{ name = 'buffer' },
	}, {
		{ name = 'luasnip' }
	})
})
