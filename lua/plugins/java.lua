return {
    "nvim-java/nvim-java",
    dependencies = {
        "nvim-java/lua-async-await",
        "nvim-java/nvim-java-refactor",
        "nvim-java/nvim-java-core",
        "nvim-java/nvim-java-test",
        "nvim-java/nvim-java-dap",
        "MunifTanjim/nui.nvim",
        "neovim/nvim-lspconfig",
        "mfussenegger/nvim-dap",
        {
            "williamboman/mason.nvim",
            opts = {
                registries = {
                    "github:nvim-java/mason-registry",
                    "github:mason-org/mason-registry",
                },
            },
        },
    },
    keys = {
        {
            "<leader>jD",
            ":JavaTestDebugCurrentClass<CR>",
            desc = "Java Debug Class",
            mode = { "n" },
        },
        {
            "<leader>jd",
            ":JavaTestDebugCurrentMethod<CR>",
            desc = "Java Debug Method",
            mode = { "n" },
        },
        {
            "<leader>jr",
            ":JavaRunnerRunMain<CR>",
            desc = "Java Run Main",
            mode = { "n" },
        },
        {
            "<leader>jvr",
            ":JavaTestViewLastReport<CR>",
            desc = "Java View Test Report",
            mode = { "n" },
        },
        {
            "<leader>jvl",
            ":JavaRunnerToggleLogs<CR>",
            desc = "Java View Runner Logs",
            mode = { "n" },
        },
    },
}
