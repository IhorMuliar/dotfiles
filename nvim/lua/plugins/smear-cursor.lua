return {
  "sphamba/smear-cursor.nvim",
  event = "VeryLazy",
  opts = {
    cursor_color = "none",  -- Matches text color at cursor
    smear_between_buffers = true,
    smear_between_neighbor_lines = true,
    stiffness = 0.6,
    trailing_stiffness = 0.45,
  },
}
