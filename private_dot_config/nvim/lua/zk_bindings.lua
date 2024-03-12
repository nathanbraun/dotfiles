local M = {}
function M.setup()

  local opts = { noremap = true, silent = true}
  local keymap = vim.api.nvim_buf_set_keymap
  local helpers = require('zk_helpers')

  vim.keymap.set('n', '<leader>zbl', '<Cmd>ZkBacklinks { sort = {"modified"} }<CR>', opts)
  vim.keymap.set('n', '<leader>zfl', '<Cmd>ZkLinks { sort = {"modified"} }<CR>', opts)
  vim.keymap.set('n', '<leader>zt', '<Cmd>ZkTags<CR>', opts)
  vim.keymap.set('n', '<leader>zx', '<Cmd>ZkIndex<CR>', opts)


  vim.keymap.set('n', '<leader>dj', function() helpers.zkDayNoteOffset(1) end, opts)
  vim.keymap.set('n', '<leader>dk', function() helpers.zkDayNoteOffset(-1) end, opts)

  vim.keymap.set('v', '<leader>zx', ":'<,'>ZkNewFromContentSelection<CR>", opts)

  vim.keymap.set('n', '<leader>zon', '<Cmd>ZkNotes { sort = {"modified"} }<CR>', opts)
  vim.keymap.set('n', '<leader>zj', '<Cmd>ZkNotes { sort = {"modified"} }<CR>', opts)
  vim.keymap.set('n', '<leader>zs', helpers.zkNotesWithOpenPaths, opts)

  local zk = require("zk")
  local commands = require("zk.commands")

  -- new notes
  vim.keymap.set('v', '<leader>znn', ":'<,'>ZkNewFromTitleSelection<CR>", opts)

  vim.keymap.set('n', '<leader>znn', '<Cmd>ZkNew<CR>', opts)
  vim.keymap.set("n", "<leader>znc", '<Cmd>ZkNew { template = "concept.md"}<CR>', opts)
  vim.keymap.set("n", "<leader>zns", '<Cmd>ZkNew { template = "source.md"}<CR>', opts)
  vim.keymap.set("n", "<leader>znpe", '<Cmd>ZkNew { template = "person.md"}<CR>', opts)
  vim.keymap.set("n", "<leader>znpr", '<Cmd>ZkNew { template = "project.md"}<CR>', opts)
  vim.keymap.set("n", "<leader>zna", ":AINewPersistentChat<CR>", { silent = true })
  vim.keymap.set("n", "<leader>znm", '<Cmd>ZkNew { template = "meeting.md"}<CR>', opts)
  vim.keymap.set("n", "<leader>znt", '<Cmd>ZkNew { template = "topic.md"}<CR>', opts)
  vim.keymap.set("n", "<leader>znh", '<Cmd>ZkNew { template = "howto.md"}<CR>', opts)
  vim.keymap.set("n", "<leader>znl", '<Cmd>ZkNew { template = "location.md"}<CR>', opts)
  vim.keymap.set("n", "<leader>znr", '<Cmd>ZkNew { template = "reference.md"}<CR>', opts)
  vim.keymap.set("n", "<leader>znq", '<Cmd>ZkNew { template = "quote.md"}<CR>', opts)
  vim.keymap.set("n", "<leader>znb", '<Cmd>ZkNew { template = "book.md"}<CR>', opts)

  commands.add("ZkYankName", function(options) helpers.yankName(options, { title = "Zk Yank" }) end)

  vim.keymap.set('n', '<leader>lwe', helpers.zkWeekNote, opts)
  vim.keymap.set('n', '<leader>wj', function() helpers.zkWeekNoteOffset(1) end, opts)
  vim.keymap.set('n', '<leader>wk', function() helpers.zkWeekNoteOffset(-1) end, opts)

  vim.keymap.set("v", "[[n", ":'<,'>ZkInsertLinkAtSelection<CR>", opts)
  vim.keymap.set("v", "[[c", ":'<,'>ZkInsertLinkAtSelection { tags = {'concept'}}<CR>", opts)
  vim.keymap.set("v", "[[s", ":'<,'>ZkInsertLinkAtSelection { tags = {'source'}}<CR>", opts)
  vim.keymap.set("v", "[[pe", ":'<,'>ZkInsertLinkAtSelection { tags = {'person'}, sort = {'title'}}<CR>", opts)
  vim.keymap.set("v", "[[pr", ":'<,'>ZkInsertLinkAtSelection { tags = {'project'}}<CR>", opts)
  vim.keymap.set("v", "[[a", ":'<,'>ZkInsertLinkAtSelection { tags = {'aichat'}, sort = {'modified'}}<CR>", opts)
  vim.keymap.set("v", "[[m", ":'<,'>ZkInsertLinkAtSelection { tags = {'meeting'}}<CR>", opts)
  vim.keymap.set("v", "[[t", ":'<,'>ZkInsertLinkAtSelection { tags = {'topic'}}<CR>", opts)
  vim.keymap.set("v", "[[h", ":'<,'>ZkInsertLinkAtSelection { tags = {'howto'}}<CR>", opts)
  vim.keymap.set("v", "[[l", ":'<,'>ZkInsertLinkAtSelection { tags = {'location'}}<CR>", opts)
  vim.keymap.set("v", "[[r", ":'<,'>ZkInsertLinkAtSelection { tags = {'reference'}}<CR>", opts)
  vim.keymap.set("v", "[[q", ":'<,'>ZkInsertLinkAtSelection { tags = {'quote'}}<CR>", opts)
  vim.keymap.set("v", "[[b", ":'<,'>ZkInsertLinkAtSelection { tags = {'book'}}<CR>", opts)
  vim.keymap.set("v", "[[d", ":'<,'>ZkInsertLinkAtSelection { tags = {'day'}}<CR>", opts)
  vim.keymap.set("v", "[[w", ":'<,'>ZkInsertLinkAtSelection { tags = {'week'}}<CR>", opts)

  vim.keymap.set("i", "[[n", "<Cmd>ZkYankName<CR>", opts)
  vim.keymap.set("i", "[[c", '<Cmd>ZkYankName { tags = {"concept"}}<CR>', opts)
  vim.keymap.set("i", "[[s", '<Cmd>ZkYankName { tags = {"source"}}<CR>', opts)
  vim.keymap.set("i", "[[pe", '<Cmd>ZkYankName { tags = {"person"}, sort = {"title"}}<CR>', opts)
  vim.keymap.set("i", "[[pr", '<Cmd>ZkYankName { tags = {"project"}}<CR>', opts)
  vim.keymap.set("i", "[[a", '<Cmd>ZkYankName { tags = {"aichat"}, sort={"modified"}}<CR>', opts)
  vim.keymap.set("i", "[[m", '<Cmd>ZkYankName { tags = {"meeting"}}<CR>', opts)
  vim.keymap.set("i", "[[t", '<Cmd>ZkYankName { tags = {"topic"}}<CR>', opts)
  vim.keymap.set("i", "[[h", '<Cmd>ZkYankName { tags = {"howto"}}<CR>', opts)
  vim.keymap.set("i", "[[l", '<Cmd>ZkYankName { tags = {"location"}}<CR>', opts)
  vim.keymap.set("i", "[[r", '<Cmd>ZkYankName { tags = {"reference"}}<CR>', opts)
  vim.keymap.set("i", "[[q", '<Cmd>ZkYankName { tags = {"quote"}}<CR>', opts)
  vim.keymap.set("i", "[[b", '<Cmd>ZkYankName { tags = {"book"}}<CR>', opts)
  vim.keymap.set("i", "[[d", '<Cmd>ZkYankName { tags = {"day"}}<CR>', opts)
  vim.keymap.set("i", "[[w", '<Cmd>ZkYankName { tags = {"week"}}<CR>', opts)

  vim.keymap.set("n", "<leader>zbc", '<Cmd>ZkBacklinks { tags = {"concept"}, sort = {"modified"} }<CR>', opts)
  vim.keymap.set("n", "<leader>zlc", '<Cmd>ZkLinks { tags = {"concept"}, sort = {"modified"} }<CR>', opts)
  vim.keymap.set("n", "<leader>zoc", '<Cmd>ZkNotes { tags = {"concept"}, sort = {"modified"} }<CR>', opts)

  vim.keymap.set("n", "<leader>zbs", '<Cmd>ZkBacklinks { tags = {"source"}, sort = {"modified"} }<CR>', opts)
  vim.keymap.set("n", "<leader>zls", '<Cmd>ZkLinks { tags = {"source"}, sort = {"modified"} }<CR>', opts)
  vim.keymap.set("n", "<leader>zos", '<Cmd>ZkNotes { tags = {"source"}, sort = {"modified"} }<CR>', opts)

  vim.keymap.set("n", "<leader>zbp", '<Cmd>ZkBacklinks { tags = {"person"}, sort = {"modified"} }<CR>', opts)
  vim.keymap.set("n", "<leader>zlp", '<Cmd>ZkLinks { tags = {"person"}, sort = {"modified"} }<CR>', opts)
  vim.keymap.set("n", "<leader>zop", '<Cmd>ZkNotes { tags = {"person"}, sort = {"modified"} }<CR>', opts)

  vim.keymap.set("n", "<leader>zba", '<Cmd>ZkBacklinks { tags = {"aichat"}, sort = {"modified"} }<CR>', opts)
  vim.keymap.set("n", "<leader>zla", '<Cmd>ZkLinks { tags = {"aichat"}, sort = {"modified"} }<CR>', opts)
  vim.keymap.set("n", "<leader>zoa", '<Cmd>ZkNotes { tags = {"aichat"}, sort = {"modified"} }<CR>', opts)

  vim.api.nvim_create_user_command('CreateLink', helpers.CreateMarkdownLinkFromWiki, {})

  vim.keymap.set('n', '<leader>zyt', '<Cmd>CreateLink<CR>', opts)
  vim.keymap.set('n', 'zT', '<Cmd>CreateLink<CR>', opts)

  vim.api.nvim_create_user_command('CopyFilePath', helpers.CopyFilePathToRegister, {})
  vim.keymap.set('n', '<leader>zyf', '<Cmd>CopyFilePath<CR>', opts)

end

return M
