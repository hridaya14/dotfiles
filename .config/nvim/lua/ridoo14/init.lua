require("ridoo14.remap")
require("ridoo14.lazy")
require("ridoo14.set")

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        os.execute("kitty @ set-spacing padding=0")
    end,
})

vim.api.nvim_create_autocmd("VimLeave", {
    callback = function()
        os.execute("kitty @ set-spacing padding=default")
    end,
})
