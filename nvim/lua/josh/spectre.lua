local status_ok, spectre = pcall(require, "spectre")
if not status_ok then
	vim.notify("Failed to load Spectre.")
	return
end

spectre.setup()
