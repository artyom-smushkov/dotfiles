return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",         -- required
        "sindrets/diffview.nvim",        -- optional - Diff integration
        "nvim-telescope/telescope.nvim", -- optional
    },
    config = function() 
        local neogit = require("neogit")
        neogit.setup({
            integrations = {
                telescope = true
            },
            graph_style = "unicode",
            commit_editor = {
                kind = "tab",
                show_staged_diff = true,
                -- Accepted values:
                -- "split" to show the staged diff below the commit editor
                -- "vsplit" to show it to the right
                -- "split_above" Like :top split
                -- "vsplit_left" like :vsplit, but open to the left
                -- "auto" "vsplit" if window would have 80 cols, otherwise "split"
                staged_diff_split_kind = "vsplit_left",
            }
        })
        vim.keymap.set("n", "<leader>g", function() neogit.open({ kind = 'vsplit' }) end, {})
    end
}
