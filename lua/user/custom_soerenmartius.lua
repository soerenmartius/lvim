local M = {}

M.config = function()
  -- lvim.colorscheme = "dracula" -- set to a custom theme
  lvim.builtin.alpha.active = false -- disable dashboard
  lvim.builtin.time_based_themes = false -- set false to use your own configured theme
  lvim.builtin.which_key.mappings["V"] = {
    name = "+split views",
    v = { "<C-W>v", "Split Vertically" },
    s = { "<C-W>s", "Split Horizontially" },
  }
  if vim.fn.has "nvim-0.9" == 1 then
    vim.opt.mousescroll = { "ver:1", "hor:6" }
    vim.o.mousefocus = true
    vim.o.mousemoveevent = true
    vim.o.splitkeep = "screen"
  end

  lvim.builtin.lsp_lines = true
  vim.diagnostic.config { virtual_lines = false } -- i only want to use it explicitly ( by calling the toggle function)
  if lvim.builtin.tmux_lualine then
    vim.opt.cmdheight = 0
    vim.opt.laststatus = 0
    vim.g.tpipeline_cursormoved = 1
    -- HACK: lualine hijacks the statusline, so we need to set it back to what we want
    if vim.env.TMUX then
      vim.cmd [[ autocmd WinEnter,BufEnter,VimResized * setlocal laststatus=0 ]]
    end
  end
	lvim.lsp.installer.setup.automatic_installation = false
  lvim.builtin.custom_web_devicons = true
  lvim.use_icons = false -- only set to false if you know what are you doing
  lvim.builtin.sell_your_soul_to_devil = { active = true, prada = false }
  lvim.lsp.document_highlight = false
  lvim.builtin.task_runner = "async_tasks"
  lvim.builtin.dap.active = true
  vim.g.instant_username = vim.env.USER
  lvim.builtin.global_statusline = false
  lvim.builtin.dressing.active = true
  lvim.builtin.fancy_wild_menu.active = true
  lvim.builtin.refactoring.active = true
  lvim.builtin.test_runner.runner = "neotest"
  lvim.format_on_save = {
    enabled = true,
    pattern = "*.rs",
    timeout = 2000,
    filter = require("lvim.lsp.utils").format_filter,
  }
  lvim.builtin.smooth_scroll = ""
  lvim.builtin.tree_provider = "neo-tree"
  lvim.builtin.noice.active = true
  lvim.builtin.go_programming.active = true
  lvim.builtin.python_programming.active = true
  lvim.builtin.web_programming.active = true
  lvim.builtin.rust_programming.active = true
  lvim.builtin.cpp_programming.active = true
  lvim.builtin.borderless_cmp = true
  lvim.builtin.colored_args = true
  lvim.builtin.inlay_hints.active = true
  -- require("lvim.lsp.manager").setup("prosemd_lsp", {})

  -- Custom soeren
  vim.opt.colorcolumn = "80,120"

	-- lvim.builtin.treesitter.indent = { enable = true, disable = { "hcl" } }
	lvim.builtin.treesitter.indent.enable = true
  lvim.builtin.treesitter.autotag.enable = true
  lvim.builtin.treesitter.rainbow.enable = true
  lvim.builtin.lastplace.active = true
  lvim.builtin.fancy_wild_menu.active = true
  lvim.builtin.nonumber_unfocus = true
  lvim.builtin.hlslens.active = true
  lvim.builtin.file_browser.active = true
  lvim.builtin.noice.active = true

  local linters = require "lvim.lsp.null-ls.linters"
  linters.setup {
    {
      command = "eslint",
      filetypes = {
        "javascript",
        "typescript",
        "typescriptreact",
        "astro",
        "vue"
      }
    },
  }

  local formatters = require "lvim.lsp.null-ls.formatters"
  formatters.setup {
    {
      command = "eslint_d",
      args = { "--fix" },
      filetypes = { "javascript", "typescript", "typescriptreact", "astro", "vue" },
    },
  }
end

return M
