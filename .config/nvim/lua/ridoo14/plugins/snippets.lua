return {
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        dependencies = {
            "rafamadriz/friendly-snippets",
        },
        event = "InsertEnter",
        config = function()
            local ls = require("luasnip")
            local s = ls.snippet
            local t = ls.text_node
            local i = ls.insert_node

            -- Load friendly snippets
            require("luasnip.loaders.from_vscode").lazy_load()

            -- Custom Go snippet
            ls.add_snippets("go", {
                s("eh", {
                    t("if err != nil {"),
                    t({ "", "\t" }), t("return nil, err"),
                    t({ "", "}" }),
                }),
            })

            -- Optional: Extend filetypes
            ls.filetype_extend("javascript", { "jsdoc" })

            -- Keybindings
            vim.keymap.set({ "i" }, "<C-s>e", function() ls.expand() end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<C-s>;", function() ls.jump(1) end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<C-s>,", function() ls.jump(-1) end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<C-E>", function()
                if ls.choice_active() then
                    ls.change_choice(1)
                end
            end, { silent = true })
        end,
    },
}

