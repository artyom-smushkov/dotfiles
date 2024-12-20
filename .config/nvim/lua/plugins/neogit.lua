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
            }
        })
        vim.keymap.set("n", "<leader>g", function() neogit.open({ kind = 'vsplit' }) end, {})
    end
}
