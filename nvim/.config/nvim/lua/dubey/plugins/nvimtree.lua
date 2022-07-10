local icons = {
	git = {
		staged = "✓",
		renamed = "➜",
		deleted = "",
		ignored = "◌",
		unstaged = "",
		unmerged = "",
		untracked = "★",
	},
	folder = {
		open = "",
		empty = "",
		default = "",
		symlink = "",
		empty_open = "",
		symlink_open = "",
	},
}

local g = vim.g

local present, tree = pcall(require, "nvim-tree")
if not present then
	return
end

local cb = require("nvim-tree.config").nvim_tree_callback
local mappings = {
	{ key = "q", cb = cb("close") },
	{ key = "d", cb = cb("remove") },
	{ key = "R", cb = cb("rename") },
	{ key = "c", cb = cb("create") },
	{ key = "r", cb = cb("refresh") },
	{ key = ".", cb = cb("dir_up") },
	{ key = "y", cb = cb("copy_path") },
	{ key = "yn", cb = cb("copy_name") },
	{ key = "<bs>", cb = cb("close_node") },
	{ key = "h", cb = cb("toggle_ignored") },
	{ key = "h", cb = cb("toggle_dotfiles") },
	{ key = { "<RightMouse>" }, cb = cb("cd") },
	{ key = "yy", cb = cb("copy_absolute_path") },
	{ key = { "<cr>", "<2-LeftMouse>" }, cb = cb("edit") },
}

tree.setup({
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  renderer = {
    highlight_opened_files = "all",
    indent_markers = {
      enable = true
    },
    icons = {
      show = {
        folder_arrow = true,
        folder = true,
        file = true,
        git = true,
      },
    },
  },
  actions = {
    open_file = {
      resize_window = true,
      window_picker = {
        enable = true,
      },
    },
  },
  open_on_setup = true,
	update_cwd = true,
  auto_reload_on_write = true,
	disable_netrw = true,
	hijack_cursor = true,
	diagnostics = {
    enable = false,
  },
	git = {
    enable = true,
    ignore = false,
  },
	update_focused_file = {
    enable = false,
    update_cwd = false,
  },
	view = {
    hide_root_folder = false,
    mappings = {
      custom_only = true,
      list = mappings,
    },
  },
})


vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
      vim.cmd "quit"
    end
  end
})
