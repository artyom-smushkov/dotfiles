return {
    {
        "nvim-telescope/telescope-ui-select.nvim",
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
                pickers = {
                    buffers = {
                        sort_lastused = true  -- Sort by last used, making the previous buffer default
                    },
                },
            })
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
            vim.keymap.set("n", "<leader>ps", builtin.live_grep, {})
            vim.keymap.set("n", "<leader>b", builtin.buffers, {})
            require("telescope").load_extension("ui-select")
        end,
    },
}
