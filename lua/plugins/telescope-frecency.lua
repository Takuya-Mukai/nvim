telescope.setup {
  extensions = {
    frecency = {
      db_root = "/home/takuyamuk/path/to/db_root",
      show_scores = false,
      show_unindexed = true,
      ignore_patterns = { "*.git/*", "*/tmp/*" },
      disable_devicons = false,
      workspaces = {
        ["conf"]    = "/home/takuyamuk/.config",
        ["data"]    = "/home/takuyamuk/.local/share",
        ["project"] = "/home/takuyamuk/projects",
        ["wiki"]    = "/home/takuyamuk/wiki"
      }
    }
  },
}
