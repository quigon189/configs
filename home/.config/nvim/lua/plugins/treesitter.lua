require'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "python", "go", "html", "css", "javascript" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
