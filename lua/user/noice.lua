local M = {}

M.config = function()
  local status_ok, noice = pcall(require, "noice")
  if not status_ok then
    return
  end
  noice.setup {
    cmdline = {
      view = "cmdline",
    },
    popupmenu = {
      enabled = not lvim.builtin.fancy_wild_menu.active,
    },
    routes = {
      {
        filter = { event = "msg_show", kind = "search_count" },
        opts = { skip = true },
      },
      {
        view = "split",
        filter = { event = "msg_show", min_height = 20 },
      },
      {
        filter = {
          event = "msg_show",
          kind = "",
          find = "written",
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "msg_show",
          kind = "",
          find = "yanked",
        },
        opts = { skip = true },
      },
      {
        filter = { find = "No active Snippet" },
        opts = { skip = true },
      },
    },
  }
end

return M