-- [[ 自动保存 ]]


local group = vim.api.nvim_create_augroup("autosave", {})

-- 修改autosave 提示为info类型（原来为warning） 并修改显提示内容增加保存时间
vim.api.nvim_create_autocmd("User", {
  pattern = "AutoSaveWritePost",
  group = group,
  callback = function(opts)
    if opts.data.saved_buffer ~= nil then
      local filename = vim.api.nvim_buf_get_name(opts.data.saved_buffer)
      if filename ~= "" then filename = string.match(filename, "[^/\\]+$") end
      vim.notify("AutoSave: saved " .. filename .. " at " .. vim.fn.strftime "%H:%M:%S", vim.log.levels.INFO)
    end
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "AutoSaveEnable",
  group = group,
  callback = function(_) vim.notify("AutoSave enabled", vim.log.levels.INFO) end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "AutoSaveDisable",
  group = group,
  callback = function(_) vim.notify("AutoSave disabled", vim.log.levels.INFO) end,
})

return {
  -- 自动保存
  {
    "okuuva/auto-save.nvim",
    opts = {
      debounce_delay = 3000,   -- 延迟3s
    },
  },
}
