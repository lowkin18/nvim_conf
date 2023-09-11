-- used to execute vscode command
local command_event_name = "vscode-command"
-- used for extension communications
local plugin_event_name = "vscode-neovim"

local M = {}

-- send commands to vscode
function M.notify(command, ...)
  return vim.rpcnotify(vim.g.vscode_channel, command_event_name, command, { ... })
end

function M.call(command, ...)
  return vim.rpcrequest(vim.g.vscode_channel, command_event_name, command, { ... })
end

-- send commands to vscode extension
function M.notify_extension(command, ...)
  return vim.rpcnotify(vim.g.vscode_channel, plugin_event_name, command, { ... })
end

function M.call_extension(command, ...)
  return vim.rpcrequest(vim.g.vscode_channel, plugin_event_name, command, { ... })
end

-- send command to vscode with range (line or char). [1, 1]-based.
function M.call_range(command, line1, line2, leaveSelection, ...)
  return M.call_extension("range-command", command, "V", line1, line2, 1, 1, leaveSelection, { ... })
end

function M.notify_range(command, line1, line2, leaveSelection, ...)
  return M.notify_extension("range-command", command, "V", line1, line2, 1, 1, leaveSelection, { ... })
end

function M.call_range_pos(command, line1, line2, pos1, pos2, leaveSelection, ...)
  return M.call_extension("range-command", command, "v", line1, line2, pos1, pos2, leaveSelection, { ... })
end

function M.notify_range_pos(command, line1, line2, pos1, pos2, leaveSelection, ...)
  return M.notify_extension("range-command", command, "v", line1, line2, pos1, pos2, leaveSelection, { ... })
end

---call from vscode to sync viewport with neovim
---@param vscode_topline number the top line of vscode visible range
---@param vscode_endline number the end line of vscode visible range
function M.scroll_viewport(vscode_topline, vscode_endline)
  local current_height = vim.api.nvim_win_get_height(0)
  local new_height = vscode_endline - vscode_topline + 1
  -- resize height
  if current_height ~= new_height then
    vim.api.nvim_win_set_height(0, new_height)
  end

  local top_line = vim.fn.line("w0")
  local diff = top_line - vscode_topline

  if diff ~= 0 and (vscode_topline > 0) then
    vim.fn.winrestview({
      topline = vscode_topline,
    })
  end
end

---Close windows
---@param wins number[]
function M.close_windows(wins)
  for _, win in ipairs(wins) do
    pcall(vim.api.nvim_win_close, win, true)
  end
end

---Delete buffers
---@param bufs number[]
function M.delete_buffers(bufs)
  for _, buf in ipairs(bufs) do
    pcall(vim.api.nvim_buf_delete, buf, { force = true })
  end
end

return M
