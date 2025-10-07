-- Centralized keymaps configuration
local map = vim.keymap.set

-- Leader key is already set in lazy.lua as " " (space)

-- ============================================
-- Disable Arrow Keys (force hjkl learning)
-- ============================================

map("n", "<Up>", "<Nop>", { desc = "Disabled: use k" })
map("n", "<Down>", "<Nop>", { desc = "Disabled: use j" })
map("n", "<Left>", "<Nop>", { desc = "Disabled: use h" })
map("n", "<Right>", "<Nop>", { desc = "Disabled: use l" })

map("v", "<Up>", "<Nop>", { desc = "Disabled: use k" })
map("v", "<Down>", "<Nop>", { desc = "Disabled: use j" })
map("v", "<Left>", "<Nop>", { desc = "Disabled: use h" })
map("v", "<Right>", "<Nop>", { desc = "Disabled: use l" })

-- ============================================
-- Telescope Keymaps
-- ============================================

map("n", "<leader>fg", function() require("telescope.builtin").live_grep() end, { desc = "Telescope live grep" })
map("n", "<leader>ff", function() require("telescope.builtin").find_files() end, {})
map("n", "<C-p>", function() require("telescope.builtin").git_files() end, {})

-- ============================================
-- LSP Keymaps (will be attached when LSP is active)
-- ============================================

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        local opts = function(desc)
            return { buffer = ev.buf, desc = desc }
        end

        map("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
        map("n", "K", vim.lsp.buf.hover, opts("Hover information"))
        map("n", "<leader>ca", vim.lsp.buf.code_action, opts("Code actions"))
        map("n", "<leader>rn", vim.lsp.buf.rename, opts("Rename symbol"))
        map("n", "gr", vim.lsp.buf.references, opts("Go to references"))
    end,
})

-- ============================================
-- Git (Fugitive) Keymaps
-- ============================================

map("n", "<leader>gs", vim.cmd.Git, {})

-- ============================================
-- Undotree Keymaps
-- ============================================

map("n", "<leader>u", function() require("undotree").toggle() end, {})

-- ============================================
-- Yazi File Manager Keymaps
-- ============================================

map("n", "<leader>-", "<cmd>Yazi<cr>", { desc = "Open yazi at current file" })
map("v", "<leader>-", "<cmd>Yazi<cr>", { desc = "Open yazi at selected file" })
map("n", "<leader>cw", "<cmd>Yazi cwd<cr>", { desc = "Open yazi in working directory" })
map("n", "<c-up>", "<cmd>Yazi toggle<cr>", { desc = "Resume last yazi session" })
