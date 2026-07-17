-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
vim.g.markdown_fenced_languages = {
  "ruby",
  "python",
  "javascript",
  "js=javascript",
  "typescript",
  "ts=typescript",
  "bash=sh",
  "json",
  "html",
  "css",
  "lua",
}

local is_wsl = (vim.uv or vim.loop).os_uname().release:lower():find("microsoft") ~= nil

if is_wsl then
  local clipboard_cache = {}
  local paste_cmd = {
    "powershell.exe",
    "-NoLogo",
    "-NoProfile",
    "-Command",
    "[Console]::Out.Write([string](Get-Clipboard -Raw))",
  }

  local function copy_to_windows(lines, regtype)
    if not lines or #lines == 0 then
      return
    end

    local copy_lines = vim.deepcopy(lines)
    if regtype == "V" and copy_lines[#copy_lines] == "" then
      table.remove(copy_lines)
    end

    clipboard_cache = {
      lines = vim.deepcopy(copy_lines),
      regtype = regtype,
    }

    local text = table.concat(copy_lines, "\n")

    local job_id = vim.fn.jobstart({ "clip.exe" }, { detach = true })
    if job_id <= 0 then
      return
    end

    vim.fn.chansend(job_id, text)
    vim.fn.chanclose(job_id, "stdin")
  end

  local function paste()
    if clipboard_cache.lines then
      return { vim.deepcopy(clipboard_cache.lines), clipboard_cache.regtype }
    end

    local text = vim.fn.system(paste_cmd)
    if vim.v.shell_error ~= 0 then
      return {}
    end

    text = text:gsub("\r\n", "\n"):gsub("\r", "\n")

    local regtype = text:sub(-1) == "\n" and "V" or "v"
    local lines = vim.split(text, "\n", { plain = true })
    if regtype == "V" then
      table.remove(lines)
    end

    return { lines, regtype }
  end

  vim.opt.clipboard = ""
  vim.g.clipboard = {
    name = "WslClipboard",
    copy = {
      ["+"] = copy_to_windows,
      ["*"] = copy_to_windows,
    },
    paste = {
      ["+"] = paste,
      ["*"] = paste,
    },
    cache_enabled = 0,
  }

  vim.api.nvim_create_autocmd("FocusGained", {
    group = vim.api.nvim_create_augroup("wsl_clipboard_cache", { clear = true }),
    callback = function()
      clipboard_cache = {}
    end,
  })
end
