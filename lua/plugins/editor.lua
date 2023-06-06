return {
  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    keys = {
            -- add a keymap to browse plugin files
            -- stylua: ignore
            {
              "<leader>fp",
              function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
              desc = "Find Plugin File",
            },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },
  -- trouble.nvim
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = {
      action_keys = { -- key mappings for actions in the trouble list
        -- map to {} to remove a mapping, for example:
        -- close = {},
        close = "q", -- close the list
        cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
        refresh = "r", -- manually refresh
        jump = { "<cr>", "<tab>" }, -- jump to the diagnostic or open / close folds
        open_split = { "s" }, -- open buffer in new split
        open_vsplit = { "v" }, -- open buffer in new vsplit
        open_tab = { "t" }, -- open buffer in new tab
      },
      use_diagnostic_signs = true, -- enabling this will use the signs defined in your lsp client
    },
  },
  {
    "mbbill/undotree",
    config = function()
      vim.g.undotree_SetFocusWhenToggle = 1
      vim.g.undotree_WindowLayout = 2
      vim.g.undotree_RelativeTimestamp = 0
    end,
    keys = {
      { "<leader>uu", "<cmd>UndotreeToggle<cr>", desc = "Toggle UndoTree" },
    },
  },
  {
    "m4xshen/hardtime.nvim",
    opts = {
      max_time = 0,
      max_count = 0,
      disable_mouse = false,
      hint = true,
      allow_different_key = false,
      resetting_keys = {
        "0",
        "1",
        "2",
        "3",
        "4",
        "5",
        "6",
        "7",
        "8",
        "9",
        "c",
        "C",
        "d",
        "x",
        "X",
        "y",
        "Y",
        "P",
        "p",
      },
      restricted_keys = { "h", "j", "k", "l", "-", "+", "gj", "gk" },
      hint_keys = { "k", "j", "^", "$", "a", "i", "d", "y", "c", "l" },
      disabled_keys = { "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>" },
      disabled_filetypes = { "qf", "netrw", "NvimTree", "lazy", "mason", "neo-tree" },
    },
  },
}
