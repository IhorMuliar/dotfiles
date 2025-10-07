return {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    config = function()
        vim.o.termguicolors = true
        require('catppuccin').setup({
            flavour = 'mocha', -- latte, frappe, macchiato, mocha
            background = {
                light = 'latte',
                dark = 'mocha',
            },
            transparent_background = true,
            integrations = {
                telescope = true,
                treesitter = true,
                which_key = true,
            },
        })
        vim.cmd.colorscheme 'catppuccin'
    end,
}
