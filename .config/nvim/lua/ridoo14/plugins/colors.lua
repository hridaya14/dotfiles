function ColorMyPencils(color)
    color = color or "rose-pine-moon"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    {
        "oxfist/night-owl.nvim",
        lazy = false,    -- Load on startup if it's your main colorscheme
        priority = 1000, -- Load before other start plugins
        config = function()
            require("night-owl").setup({
                bold = true,
                italics = true,
                underline = true,
                undercurl = true,
                transparent_background = false,
            })
            vim.cmd.colorscheme("night-owl")
        end,
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    },
}
