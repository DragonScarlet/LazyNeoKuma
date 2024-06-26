return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        { "nvim-lualine/lualine.nvim" },
    },
    config = function()
        local theme = function()
            local colors = {
                darkgray = "#16161d",
                gray = "#727169",
                innerbg = nil,
                outerbg = "#16161D",
                normal = "#7e9cd8",
                insert = "#98bb6c",
                visual = "#ffa066",
                replace = "#e46876",
                command = "#e6c384",
            }
            return {
                inactive = {
                    a = { fg = colors.gray, bg = colors.outerbg, gui = "bold" },
                    b = { fg = colors.gray, bg = colors.outerbg },
                    c = { fg = colors.gray, bg = colors.innerbg },
                },
                visual = {
                    a = { fg = colors.darkgray, bg = colors.visual, gui = "bold" },
                    b = { fg = colors.gray, bg = colors.outerbg },
                    c = { fg = colors.gray, bg = colors.innerbg },
                },
                replace = {
                    a = { fg = colors.darkgray, bg = colors.replace, gui = "bold" },
                    b = { fg = colors.gray, bg = colors.outerbg },
                    c = { fg = colors.gray, bg = colors.innerbg },
                },
                normal = {
                    a = { fg = colors.darkgray, bg = colors.normal, gui = "bold" },
                    b = { fg = colors.gray, bg = colors.outerbg },
                    c = { fg = colors.gray, bg = colors.innerbg },
                },
                insert = {
                    a = { fg = colors.darkgray, bg = colors.insert, gui = "bold" },
                    b = { fg = colors.gray, bg = colors.outerbg },
                    c = { fg = colors.gray, bg = colors.innerbg },
                },
                command = {
                    a = { fg = colors.darkgray, bg = colors.command, gui = "bold" },
                    b = { fg = colors.gray, bg = colors.outerbg },
                    c = { fg = colors.gray, bg = colors.innerbg },
                },
            }
        end
        -- Eviline config for lualine
        -- Author: shadmansaleh
        -- Credit: glepnir
        local lualine = require("lualine")

        -- Color table for highlights
        -- stylua: ignore
        local colors = {
            bg       = '#202328',
            fg       = '#bbc2cf',
            yellow   = '#ECBE7B',
            cyan     = '#008080',
            darkblue = '#081633',
            green    = '#98be65',
            orange   = '#FF8800',
            violet   = '#a9a1e1',
            magenta  = '#c678dd',
            blue     = '#51afef',
            red      = '#ec5f67',
        }

        local mode_color = {
            n = colors.red,
            i = colors.green,
            v = colors.blue,
            [""] = colors.blue,
            V = colors.blue,
            c = colors.magenta,
            no = colors.red,
            s = colors.orange,
            S = colors.orange,
            ic = colors.yellow,
            R = colors.violet,
            Rv = colors.violet,
            cv = colors.red,
            ce = colors.red,
            r = colors.cyan,
            rm = colors.cyan,
            ["r?"] = colors.cyan,
            ["!"] = colors.red,
            t = colors.red,
        }

        local conditions = {
            buffer_not_empty = function()
                return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
            end,
            hide_in_width = function()
                return vim.fn.winwidth(0) > 80
            end,
            check_git_workspace = function()
                local filepath = vim.fn.expand("%:p:h")
                local gitdir = vim.fn.finddir(".git", filepath .. ";")
                return gitdir and #gitdir > 0 and #gitdir < #filepath
            end,
        }

        -- Config
        local config = {
            options = {
                -- Disable sections and component separators
                component_separators = "",
                section_separators = "",
                globalstatus = true,
                theme = theme() -- right section. Both are highlighted by c theme .  So we
                -- are just setting default looks o statusline
                --normal = { c = { fg = colors.fg, bg = colors.bg } },
                --inactive = { c = { fg = colors.fg, bg = colors.bg } },
                , -- We are going to use lualine_c an lualine_x as left and
            },
            sections = {
                -- these are to remove the defaults
                lualine_a = {},
                lualine_b = {},
                lualine_y = {},
                lualine_z = {},
                -- These will be filled later
                lualine_c = {},
                lualine_x = {},
            },
            inactive_sections = {
                -- these are to remove the defaults
                lualine_a = {},
                lualine_b = {},
                lualine_y = {},
                lualine_z = {},
                lualine_c = {},
                lualine_x = {},
            },
        }

        -- Inserts a component in lualine_c at left section
        local function ins_left(component)
            table.insert(config.sections.lualine_c, component)
        end

        -- Inserts a component in lualine_x ot right section
        local function ins_right(component)
            table.insert(config.sections.lualine_x, component)
        end

        ins_left({
            function()
                return ""
            end,
            color = function()
                return { fg = mode_color[vim.fn.mode()] }
            end,
            padding = { left = 0, right = 1 }, -- We don't need space before this
        })

        ins_left({
            -- mode component
            function()
                return "╰(● ⋏ ●)╯"
            end,
            color = function()
                return { fg = mode_color[vim.fn.mode()] }
            end,
            padding = { right = 1 },
        })

        ins_left({
            -- filesize component
            "filesize",
            cond = conditions.buffer_not_empty,
        })

        ins_left({
            "filename",
            cond = conditions.buffer_not_empty,
            color = { fg = colors.magenta, gui = "bold" },
        })

        ins_left({ "location" })

        ins_left({ "progress", color = { fg = colors.fg, gui = "bold" } })

        ins_left({
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = { error = " ", warn = " ", info = " " },
            diagnostics_color = {
                color_error = { fg = colors.red },
                color_warn = { fg = colors.yellow },
                color_info = { fg = colors.cyan },
            },
        })

        -- Insert mid section. You can make any number of sections in neovim :)
        -- for lualine it's any number greater then 2
        ins_left({
            function()
                return "%="
            end,
        })

        ins_left({
            function()
                if vim.fn.reg_recording() ~= "" then
                    return "Recording"
                end
                return ""
            end,
        })

        -- Add components to right sections
        ins_right({
            "o:encoding",       -- option component same as &encoding in viml
            fmt = string.upper, -- I'm not sure why it's upper case either ;)
            cond = conditions.hide_in_width,
            color = { fg = colors.green, gui = "bold" },
        })

        ins_right({
            "fileformat",
            fmt = string.upper,
            icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
            color = { fg = colors.green, gui = "bold" },
        })

        ins_right({
            "branch",
            icon = "",
            color = { fg = colors.violet, gui = "bold" },
        })

        ins_right({
            "diff",
            -- Is it me or the symbol for modified us really weird
            symbols = { added = " ", modified = "柳 ", removed = " " },
            diff_color = {
                added = { fg = colors.green },
                modified = { fg = colors.orange },
                removed = { fg = colors.red },
            },
            cond = conditions.hide_in_width,
        })

        ins_right({
            -- Lsp server name .
            function()
                local icons = {
                    jdtls = "",
                    lua_ls = "",
                    lemminx = "󰗀",
                    jsonls = "󰘦",
                    tsserver = "",
                    pylsp = "󰌠",
                    docker_compose_language_service = "",
                    yamlls = "",
                }
                local msg = "󰊗"
                local filename = vim.api.nvim_buf_get_name(0)
                if filename:sub(-5) == ".java" then
                    return icons.jdtls
                end
                local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
                local clients = vim.lsp.get_active_clients()
                if next(clients) == nil then
                    return msg
                end
                for _, client in ipairs(clients) do
                    local filetypes = client.config.filetypes
                    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                        if icons[client.name] ~= nil then
                            return icons[client.name]
                        end
                        return client.name
                    end
                end
                return msg
            end,
            icon = "=＾● ⋏ ●＾=",
            color = function()
                return { fg = colors.blue }
            end,
        })

        ins_right({
            function()
                local status = require("ollama").status()

                if status == "IDLE" then
                    return "󱙺" -- nf-md-robot-outline
                elseif status == "WORKING" then
                    return "󰚩" -- nf-md-robot
                end
            end,
            cond = function()
                return package.loaded["ollama"] and require("ollama").status() ~= nil
            end,
            color = function()
                return { fg = mode_color[vim.fn.mode()] }
            end,
        })

        ins_right({
            function()
                return ""
            end,
            color = function()
                return { fg = mode_color[vim.fn.mode()] }
            end,
            padding = { left = 1 },
        })

        -- Now don't forget to initialize lualine
        lualine.setup(config)
    end,
}
