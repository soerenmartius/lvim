local M = {}

-- local opts = {
--   settings = {
--     volar = {
--       vueserver = { useSecondServer = true },
--     },
--   },
-- }
-- require("lvim.lsp.manager").setup("volar", opts)

M.config = function()
  local status_ok, vue = pcall(require, "volar")
  if not status_ok then
    return
  end

  local ok, lvim_lsp = pcall(require, "lvim.lsp")
  if not ok then
    return
  end

  vue.setup {
    disable_commands = false, -- prevent the plugin from creating Vim commands
    disable_formatting = true, -- disable tsserver's formatting capabilities
    debug = false, -- enable debug logging for commands
    server = { -- pass options to lspconfig's setup method
      on_attach = on_attach,
      capabilities = lvim_lsp.common_capabilities(),
    },
  }

end

return M
