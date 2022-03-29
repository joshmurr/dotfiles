local status_ok, monokai = pcall(require, "monokai")
if not status_ok then
	vim.notify("Monokai theme not found!")
	return
end
monokai.setup({
	palette = {
		base2 = "#101010",
	},
})
