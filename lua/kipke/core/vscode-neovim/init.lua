local api = require("kipke.core.vscode-neovim.api")
local defaults = require("kipke.core.vscode-neovim.defaults")
local cursor = require("kipke.core.vscode-neovim.cursor")

local M = {}

M.notify = api.notify
M.call = api.call
M.call_range = api.call_range
M.notify_range = api.notify_range
M.call_range_pos = api.call_range_pos
M.notify_range_pos = api.notify_range_pos

M.setup = function()
  defaults.setup()
  cursor.setup()
end

return M


