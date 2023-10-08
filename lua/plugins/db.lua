return {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    { "iMithrellas/vim-dadbod", lazy = true },
    { "tpope/vim-dispatch", lazy = true },
    { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
  },
  cmd = {
    "DBUI",
    "DBUIToggle",
    "DBUIAddConnection",
    "DBUIFindBuffer",
  },
  init = function()
    -- Your DBUI configuration
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_exec_sql_server = "C:\\Program Files\\Microsoft SQL Server\\170\\Tools\\Binn\\sqlcmd.exe"
  end,
}
