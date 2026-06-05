-- Custom statusline by vimjeremy

_G.stl_mode = function()
  local overrides = {
    V = 'V-L',
    ['\22'] = 'V-B',
  }

  return overrides[vim.fn.mode()] or vim.fn.mode():upper()
end

_G.stl_diagnostic = function()
  local diagnostics = vim.diagnostic.get(0)
  local counts = { E = 0, W = 0 }

  for _, d in ipairs(diagnostics) do
    if d.severity == vim.diagnostic.severity.ERROR then
      counts.E = counts.E + 1
    elseif d.severity == vim.diagnostic.severity.WARN then
      counts.W = counts.W + 1
    end
  end

  return string.format('W:%d E:%d', counts.W, counts.E)
end

_G.stl_fmod = function()
  if vim.bo.modified then
    return '*'
  else
    return ''
  end
end

_G.stl_branch = function()
  local handle = io.popen 'git branch --show-current 2>&1 | head -n 1'
  if handle then
    local output = handle:read('*a'):gsub('%s+', '')
    handle:close()
    if string.find(output, 'fatal') then
      return ''
    else
      return '| b:' .. output
    end
  else
    return ''
  end
end

_G.stl_ft = function()
  if vim.bo.filetype ~= '' then
    return '| ' .. vim.bo.filetype .. ' '
  else
    return ''
  end
end

vim.o.showmode = false
vim.o.ruler = false
vim.o.statusline =
  ' %{luaeval("stl_mode()")} | %<%f%{luaeval("stl_fmod()")} %{luaeval("stl_branch()")} %=[%n] | %{luaeval("stl_diagnostic()")} %{luaeval("stl_ft()")}| %P '
