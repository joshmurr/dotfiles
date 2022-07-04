local status_ok, todo = pcall(require, "todo-comments")
if not status_ok then
	vim.notify("Failed to load TODO Comments.")
	return
end

todo.setup()
