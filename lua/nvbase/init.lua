vim.o.statusline = "%!v:lua.require('nvbase.stl.statusline')()"
require("nvbase.stl.utils").autocmds()

vim.schedule(function()
	require("nvbase.autocmds")
end)
