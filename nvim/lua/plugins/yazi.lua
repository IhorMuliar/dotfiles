return {
	"mikavilpas/yazi.nvim",
	version = "*",
	event = "VeryLazy",
	dependencies = {
		{ "nvim-lua/plenary.nvim", lazy = true },
	},
	---@type YaziConfig
	opts = {
		-- open yazi instead of netrw for directories
		open_for_directories = false,

		-- open visible splits as yazi tabs
		open_multiple_tabs = false,

		-- floating window settings
		floating_window_scaling_factor = 0.9,
		yazi_floating_window_border = "rounded",
		yazi_floating_window_winblend = 0,

		-- highlight settings
		highlight_hovered_buffers_in_same_directory = true,

		-- keymaps inside yazi (these are the defaults)
		keymaps = {
			show_help = "<f1>",
			open_file_in_vertical_split = "<c-v>",
			open_file_in_horizontal_split = "<c-x>",
			open_file_in_tab = "<c-t>",
			grep_in_directory = "<c-s>",
			replace_in_directory = "<c-g>",
			cycle_open_buffers = "<tab>",
			copy_relative_path_to_selected_files = "<c-y>",
			send_to_quickfix_list = "<c-q>",
		},
	},
}