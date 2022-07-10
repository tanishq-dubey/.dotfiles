local options = {
	mouse = "a", -- use the mouse
	tabstop = 2, -- tabs are two spaces
	wrap = false, -- don't wrap lines
	cmdheight = 2, -- make bottom command size bigger
	number = true, -- show numbers on the side
	hlsearch = true, -- highlight search results
	shiftwidth = 2, -- Nubmer of spaces to use for each step of (auto)indent
	undofile = true, -- create and use a undo file
	numberwidth = 4, -- how wide the number column is
	swapfile = false, -- I don't like swap files
	timeoutlen = 100, -- reduce waiting time
	expandtab = true, -- tabs are spaces
  smartcase = true, -- case insensitive unless there are caps characters
  updatetime = 300, -- millis idle before vim saves state
  ignorecase = true, -- case insensitive search
  splitbelow = true, -- create splits below current window
  splitright = true, -- create splits on right side of current window
  sidescrolloff = 8, -- The minimal number of screen columns to keep to the left and to the right of the cursor
  cursorline = true, -- show a line at the cursor position (highlight the line)
  signcolumn = "yes", -- show a column next to numbers for signs (such as git)
  smartindent = true, -- uhhhh...smartly try to indent text?
  writebackup = true, -- Make a backup before overwriting a file
  termguicolors = true, -- really pretty colors
  foldmethod = "syntax", -- use syntax to fold code
  fileencoding = "utf-8", -- the best encoding
  relativenumber = false, -- who even uses relative numbers
  clipboard = "unnamedplus", -- copy into register and system clipboard
  completeopt = { "menuone", "noselect" }, -- how to show completion options
  background = "dark", -- light backgrounds for light themes
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
