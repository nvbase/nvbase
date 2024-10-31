local options = {
	base46 = {
		theme = "onedark",
		changed_themes = {},
	},
}

local status, chadrc = pcall(require, "chadrc")
return vim.tbl_deep_extend("force", options, status and chadrc or {})
