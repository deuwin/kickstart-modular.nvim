return {
    "gennaro-tedesco/nvim-possession",
    enabled = true,
    dependencies = {
        "ibhagwan/fzf-lua",
    },
    config = true,
    init = function()
        require("nvim-possession").setup({
            autoload = true,
            autoswitch = {
                enable = true,
            },
        })

        -- key mappings
        local possession = require("nvim-possession")
        vim.keymap.set("n", "<leader>pl",
            function()
                possession.list()
            end,
            { desc = "[P]ossession, [L]ist existing sessions" }
        )
        vim.keymap.set("n", "<leader>pn",
            function()
                possession.new()
            end,
            { desc = "[P]ossession, [N]ew session" }
        )
        vim.keymap.set("n", "<leader>pu",
            function()
                possession.update()
            end,
            { desc = "[P]ossession, [U]pdate current session" }
        )
        vim.keymap.set("n", "<leader>pd",
            function()
                possession.delete()
            end,
            { desc = "[P]ossession, [D]elete current session" }
        )
    end,
}
