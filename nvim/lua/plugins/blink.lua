return {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',
    opts = {
        keymap = { preset = 'default' },

        appearance = {
            nerd_font_variant = 'mono'
        },

        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' }
        },

        completion = {
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 500
            },
            ghost_text = { enabled = true }
        },

        signature = {
            enabled = true,
            window = {
                show_documentation = true
            }
        }
    },
    opts_extend = { "sources.default" }
}
