return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        {
            "nvim-telescope/telescope-dap.nvim",
            config = function()
                LazyVim.on_load("telescope.nvim", function()
                    require('telescope').load_extension('dap')
                end)
            end,
            keys = {
                {
                    "<leader>dv",
                    ":Telescope dap variables<cr>",
                    desc = "Dap Variables",
                    mode = { "n" },
                },
            },
        },
    },
}
