--[[ 窗格相关插件 ]]
--
-- local navic = require 'nvim-navic'
-- local devicons = require 'nvim-web-devicons'
--
return {
  -- 切换绝对行号和相对行号的插件
  { "sitiom/nvim-numbertoggle" },

  -- 正在使用的窗口高亮
  {
    "nvim-zh/colorful-winsep.nvim",
     -- config = true,
    config = function()
        require("colorful-winsep").setup({
        -- 设置颜色为绿色
        highlight = "#e3c288",  -- 前景色 -
        -- 其他可选配置
        symbols = { "━", "┃", "┏", "┓", "┗", "┛" },
        smooth = true,
        })
    end,
    event = { "WinLeave" },
  },

  -- 显示对应的文件名
  {
    "b0o/incline.nvim",

    dependencies = {
        { "SmiteshP/nvim-navic" },
        { "nvim-tree/nvim-web-devicons" },
    },
    config = function()
        local devicons = require 'nvim-web-devicons'

        require("incline").setup({

            window = {
                margin = { horizontal = 0, vertical = 0},
                options = {
                    signcolumn = "no",
                    wrap = false
                },
                overlap = {
                    borders = false,
                    statusline = false,
                    tabline = false,
                    winbar = false
                },
                padding = 1,
                padding_char = " ",
                placement = {
                    horizontal = "right",
                    vertical = "bottom"
                },
                width = "fit",
                winhighlight = {
                    active = {
                        EndOfBuffer = "None",
                        Normal = "InclineNormal",
                        Search = "None"
                    },
                    inactive = {
                        EndOfBuffer = "None",
                        Normal = "InclineNormalNC",
                        Search = "None"
                    }
                },
                zindex = 50
            },

            render = function(props)
                local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
                if filename == '' then
                    filename = '[No Name]'
                end
                local ft_icon, ft_color = devicons.get_icon_color(filename)

                local function get_git_diff()
                    local icons = { removed = '-', changed = '!', added = '+' }
                    -- local icons = { removed = ' ', changed = ' ', added = ' ' }
                    local signs = vim.b[props.buf].gitsigns_status_dict
                    local labels = {}
                    if signs == nil then
                        return labels
                    end
                    for name, icon in pairs(icons) do
                        if tonumber(signs[name]) and signs[name] > 0 then
                            table.insert(labels, { icon .. signs[name] .. ' ', group = 'Diff' .. name })
                        end
                    end
                    if #labels > 0 then
                        table.insert(labels, { '┊ ' })
                    end
                    return labels
                end

                local function get_diagnostic_label()
                    local icons = { error = ' ', warn = ' ', info = ' ', hint = ' ' }
                    -- local icons = { error = ' ', warn = ' ', info = ' ', hint = '' }
                    local label = {}

                    for severity, icon in pairs(icons) do
                        local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
                        if n > 0 then
                            table.insert(label, { icon .. n .. ' ', group = 'DiagnosticSign' .. severity })
                        end
                    end
                    if #label > 0 then
                        table.insert(label, { '┊ ' })
                    end
                    return label
                end

                return {
                    {"↖ ", guifg = "#888888", guibg = "none"},
                    -- { get_diagnostic_label() },
                    -- { get_git_diff() },
                    { filename .. ' ', gui = vim.bo[props.buf].modified and 'bold,italic' or 'bold' },
                    { (ft_icon or '') .. " " , guifg = ft_color, guibg = 'none' },
                    -- { '┊  ' .. vim.api.nvim_win_get_number(props.win), group = 'DevIconWindows' },
                }
            end,
        })
    end,
    -- Optional: Lazy load Incline
    event = "VeryLazy",
  },
}
