-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- 行长度参考线
vim.wo.colorcolumn = "80,100,120"

opt.clipboard = "" -- "unnamedplus" -- ""不使用 "unnamedplus"使用 系统粘贴板
opt.mouse = "a" -- ""不启用  "a"启用 鼠标支持
-- [设置+*寄存器内容和系统粘贴板打通]
function MyPaste(_)
  return function(_)
    --[ 返回 “” 寄存器的内容，用来作为 p 操作符的粘贴物 ]
    local content = vim.fn.getreg('"')
    return vim.split(content, "\n")
  end
end

if os.getenv("SSH_TTY") == nil then
  --
  --[ 当前环境为本地环境，也包括 wsl ]
  -- opt.clipboard:append("unnamedplus")
else
  -- opt.clipboard:append("unnamedplus")
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
      ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    paste = {
      --[ 小括号里面的内容可能是毫无意义的，但是保持原样可能看起来更好一点 ]
      ["+"] = MyPaste("+"),
      ["*"] = MyPaste("*"),
    },
  }
end

-- Tab
opt.tabstop = 4 -- tab键N个空格字符
opt.softtabstop = 4 -- number of spacesin tab when editing
opt.shiftwidth = 4 --  如果多行通过shift 缩进，此时每次前进N格
opt.expandtab = true -- tabs are spaces, mainly because of python

-- UI config
opt.number = true -- show absolute number
opt.relativenumber = true -- add numbers to each line on the left side
opt.cursorline = true -- highlight cursor line underneath the cursor horizontally
opt.splitbelow = true -- open new vertical split bottom
opt.splitright = true -- open new horizontal splits right
-- vim.opt.termguicolors = true        -- enabl 24-bit RGB color in the TUI
opt.showmode = false -- we are experienced, wo don't need the "-- INSERT --" mode hint

-- 自动切换绝对行号和相对行号 已经使用插件代替了
-- vim.cmd([[
--   augroup LineNumberToggle
--     autocmd!
--     " 进入普通模式时，启用相对行号
--     autocmd InsertLeave * set relativenumber
--     " 进入插入模式时，禁用相对行号，启用绝对行号
--     autocmd InsertEnter * set norelativenumber
--   augroup END
-- ]])

-- Searching
opt.incsearch = true -- search as characters are entered
opt.hlsearch = false -- do not highlight matches
opt.ignorecase = true -- ignore case in searches by default
opt.smartcase = true -- but make it case sensitive if an uppercase is entered

-- 修改不可见字符
opt.list = true -- 启用不可见字符显示
opt.listchars = { -- 不可见字符设置
  -- space = " ", -- 普通空格
  tab = "▸ ", -- 制表符
  trail = "·", -- 行尾空格
  -- extends = "›", -- 换行指示符
  -- precedes = "‹", -- 换行指示符
  -- nbsp = "␣", -- 非断空格
}
