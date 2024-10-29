local M = {}

M.reload = function(module)
  require("plenary.reload").reload_module "nvconfig"
  require("plenary.reload").reload_module "chadrc"
  require("plenary.reload").reload_module "base46"
  require("plenary.reload").reload_module "nvbase"

  if module then
    require("plenary.reload").reload_module(module)
  end

  require "nvbase"
  require("base46").load_all_highlights()
end

return M
