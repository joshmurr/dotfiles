local status_ok, focus = pcall(require, "focus")
if not status_ok then
	vim.notify("Failed to load Focus.")
	return
end

focus.setup({
	width = 120,
})
