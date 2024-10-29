local options = {
  base46 = {
    theme = "onedark",
    integrations = {},
    changed_themes = {}
  },

  ui = {
    cmp = {
      icons_left = false, -- only for non-atom styles!
      lspkind_text = true,
      style = "default",  -- default/flat_light/flat_dark/atom/atom_colored
      format_colors = {
        tailwind = false, -- will work for css lsp too
        icon = "󱓻",
      },
    },

    statusline = {
      theme = "vscode_colored",
      order = nil,
      modules = nil,
    }
  },

  mason = { pkgs = {} }
}

local status, chadrc = pcall(require, "chadrc")
return vim.tbl_deep_extend("force", options, status and chadrc or {})
