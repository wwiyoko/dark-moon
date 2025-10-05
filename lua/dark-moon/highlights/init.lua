local config = require("dark-moon.config")
local merge_table = require("dark-moon.utils.api").merge_table

local M = {}

local builtins = { "editor", "syntax", "lsp", "diagnostic" }
local semantics = { "lua", "markdown" }
local plugins = {
    "treesitter",
    "cmp",
    "gitsigns",
    "telescope",
    "nvim_tree",
    "indent_blankline",
    "which_key",
    "nvim_notify",
    "dashboard_nvim",
    "oil",
    "mason"
}

function M.get_hl_groups()
    local hl_groups = {}
    for _, builtin in ipairs(builtins) do
        hl_groups = merge_table(
            hl_groups,
            require("dark-moon.highlights.builtins." .. builtin)
        )
    end

    for _, plugin in ipairs(plugins) do
        hl_groups = merge_table(hl_groups, require("dark-moon.highlights.plugins." .. plugin))
    end

    for _, semantic in ipairs(semantics) do
        hl_groups = merge_table(
            hl_groups,
            require("dark-moon.highlights.semantics." .. semantic)
        )
    end

    return merge_table(hl_groups, config.options.overrides)
end

function M.set_term_colors()
    local colors = require("dark-moon.highlights.builtins.terminal")
    for term, color in pairs(colors) do
        vim.g[term] = color
    end
end

return M
