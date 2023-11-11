require("tabnine").setup({
	disable_auto_comment = true,
	accept_keymap = "<C-f>",
	dismiss_keymap = "<C-j>",
	debounce_ms = 1000,
	suggestion_color = { gui = "#808080", cterm = 244 },
	exclude_filetypes = { "TelescopePrompt" },
})
