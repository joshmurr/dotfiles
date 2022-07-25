local status_ok, autotag = pcall(require, "nvim-ts-autotag")
if not status_ok then
	vim.notify("Failed to load Auto-Tag Comments.")
	return
end

autotag.setup({
	enable = true,
})
