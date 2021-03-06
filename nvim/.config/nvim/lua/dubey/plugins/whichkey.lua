local present, which_key = pcall(require, "which-key")
if not present then
	return
end

local setup = {
	plugins = {
		marks = true,
		registers = true,
		spelling = {
			enabled = true,
			suggestions = 20,
		},
		presets = {
			operators = true,
			motions = true,
			text_objects = true,
			windows = true,
			nav = true,
			z = true,
			g = true,
		},
	},
	icons = {
		breadcrumb = "»",
		separator = "➜",
		group = "+",
	},
	popup_mappings = {
		scroll_down = "<c-d>",
		scroll_up = "<c-u>",
	},
	window = {
		border = "rounded",
		position = "bottom",
		margin = { 1, 0, 1, 0 },
		padding = { 2, 2, 2, 2 },
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 },
		width = { min = 20, max = 50 },
		spacing = 3,
		align = "left",
	},
	ignore_missing = true,
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
	show_help = true,
	triggers = "auto",
	triggers_blacklist = {
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local leader_opts = {
	mode = "n",
	prefix = "<leader>",
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = true,
}

local leader_mappings = {
	w = {
		"<esc>:w!<bar>:lua vim.notify(vim.fn.expand('%'), 'success', { title = 'Buffer Saved' })<cr>",
		"Save Buffer",
	},
	W = {
		"<esc>:SudaWrite<bar>:lua vim.notify(vim.fn.expand('%'), 'success', { title = 'Buffer saved with sudo' })<cr>",
		"Sudo Save Buffer",
	},
	x = { "<cmd>:q<cr>", "Quit Buffer" },
	z = { "<cmd>ZenMode<cr>", "Zen Mode" },
	q = { "<cmd>conf qa<cr>", "Quit Nvim" },
	c = { "<cmd>Bdelete!<cr>", "Close Buffer" },
	h = { "<cmd>nohlsearch<cr>", "Clear Highlight" },
	e = { "<cmd>NvimTreeToggle<cr>", "File Explorer" },
	s = { "<cmd>SessionManager save_current_session<cr>", "Save Session" },
	f = {
		name = "Find",
    y = { "<cmd>Telescope neoclip<cr>", "Yanks" },
		h = { "<cmd>Telescope help_tags<cr>", "Help" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		t = { "<cmd>Telescope live_grep<cr>", "Text" },
		b = { "<cmd>Telescope buffers<cr>", "Buffers" },
		f = { "<cmd>Telescope find_files<cr>", "Files" },
		o = { "<cmd>Telescope oldfiles<cr>", "Recents" },
		c = { "<cmd>Telescope commands<cr>", "Commands" },
		m = { "<cmd>Telescope man_pages<cr>", "Manuals" },
		r = { "<cmd>Telescope registers<cr>", "Registers" },
		s = { "<cmd>SessionManager load_session<cr>", "Sessions" },
	},
	p = {
		name = "Packer",
		s = { "<cmd>PackerSync<cr>", "Sync" },
		S = { "<cmd>PackerStatus<cr>", "Status" },
		u = { "<cmd>PackerUpdate<cr>", "Update" },
		c = { "<cmd>PackerCompile<cr>", "Compile" },
		i = { "<cmd>PackerInstall<cr>", "Install" },
	},
	g = {
		name = "Git",
		s = { "<cmd>Telescope git_status<cr>", "File Git Status" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
	},
	l = {
		name = "LSP",
		I = { "<cmd>LspInfo<cr>", "Info" },
		i = { "<cmd>LspInstall<cr>", "Install" },
		a = { "<cmd>AerialToggle<cr>", "Aerial" },
		f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
		w = { "<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics" },
		d = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Document Diagnostics" },
	},
	t = {
		name = "Terminal",
		f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
		v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
		h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
	},
	v = {
		name = "ViMux",
		r = { "<cmd>VimuxPromptCommand<CR>", "Run Command" },
		l = { "<cmd>VimuxRunLastCommand<cr>", "Run Last" },
	},
}

which_key.setup(setup)
which_key.register(leader_mappings, leader_opts)

