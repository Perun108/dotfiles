return {
  "ibhagwan/fzf-lua",
  opts = {
    files = {
      find_opts = [[-type f -not -path '*/tests/*']],
      rg_opts = [[--color=never --hidden --files -g "!.git" -g "!*/tests/*"]],
      -- With trial and error I could find that it is the following option that controls what dirs are excluded from <leader>ff
      fd_opts = [[--color=never --hidden --type f --type l --exclude .git --exclude tests]],
    },
    grep = {
      -- This didn't work and excluded dirs were seen
      -- grep_opts = "--binary-files=without-match --line-number --recursive --color=auto --perl-regexp --exclude-dir=tests -e",
      -- With trial and error I could find that it is the following option that controls what dirs are excluded from <leader>sg
      rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096 -g '!*/tests/*' -g '!*/api/*' -e",
    },
  },
  keys = {
    { "<c-j>", "<c-j>", ft = "fzf", mode = "t", nowait = true },
    { "<c-k>", "<c-k>", ft = "fzf", mode = "t", nowait = true },
    {
      "<leader>F,",
      "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>",
      desc = "Switch Buffer",
    },
    { "<leader>F/", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },
    { "<leader>F:", "<cmd>FzfLua command_history<cr>", desc = "Command History" },
    -- { "<leader><space>", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
    -- find
    { "<leader>Fb", "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
    { "<leader>Fc", LazyVim.pick.config_files(), desc = "Find Config File" },
    { "<leader>Ff", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
    { "<leader>FF", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
    { "<leader>Fg", "<cmd>FzfLua git_files<cr>", desc = "Find Files (git-files)" },
    { "<leader>Fr", "<cmd>FzfLua oldfiles<cr>", desc = "Recent" },
    { "<leader>FR", LazyVim.pick("oldfiles", { cwd = vim.uv.cwd() }), desc = "Recent (cwd)" },
    -- git
    { "<leader>Gc", "<cmd>FzfLua git_commits<CR>", desc = "Commits" },
    { "<leader>Gs", "<cmd>FzfLua git_status<CR>", desc = "Status" },
    -- search
    { '<leader>Z"', "<cmd>FzfLua registers<cr>", desc = "Registers" },
    { "<leader>Za", "<cmd>FzfLua autocmds<cr>", desc = "Auto Commands" },
    { "<leader>Zb", "<cmd>FzfLua grep_curbuf<cr>", desc = "Buffer" },
    { "<leader>Zc", "<cmd>FzfLua command_history<cr>", desc = "Command History" },
    { "<leader>ZC", "<cmd>FzfLua commands<cr>", desc = "Commands" },
    { "<leader>Zd", "<cmd>FzfLua diagnostics_document<cr>", desc = "Document Diagnostics" },
    { "<leader>ZD", "<cmd>FzfLua diagnostics_workspace<cr>", desc = "Workspace Diagnostics" },
    { "<leader>Zg", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },
    { "<leader>ZG", LazyVim.pick("live_grep", { root = false }), desc = "Grep (cwd)" },
    { "<leader>Zh", "<cmd>FzfLua help_tags<cr>", desc = "Help Pages" },
    { "<leader>ZH", "<cmd>FzfLua highlights<cr>", desc = "Search Highlight Groups" },
    { "<leader>Zj", "<cmd>FzfLua jumps<cr>", desc = "Jumplist" },
    { "<leader>Zk", "<cmd>FzfLua keymaps<cr>", desc = "Key Maps" },
    { "<leader>Zl", "<cmd>FzfLua loclist<cr>", desc = "Location List" },
    { "<leader>ZM", "<cmd>FzfLua man_pages<cr>", desc = "Man Pages" },
    { "<leader>Zm", "<cmd>FzfLua marks<cr>", desc = "Jump to Mark" },
    { "<leader>ZR", "<cmd>FzfLua resume<cr>", desc = "Resume" },
    { "<leader>Zq", "<cmd>FzfLua quickfix<cr>", desc = "Quickfix List" },
    { "<leader>Zw", LazyVim.pick("grep_cword"), desc = "Word (Root Dir)" },
    { "<leader>ZW", LazyVim.pick("grep_cword", { root = false }), desc = "Word (cwd)" },
    { "<leader>Zw", LazyVim.pick("grep_visual"), mode = "v", desc = "Selection (Root Dir)" },
    { "<leader>ZW", LazyVim.pick("grep_visual", { root = false }), mode = "v", desc = "Selection (cwd)" },
    -- { "<leader>uC", LazyVim.pick("colorschemes"), desc = "Colorscheme with Preview" },
    -- {
    --   "<leader>ss",
    --   function()
    --     require("fzf-lua").lsp_document_symbols({
    --       regex_filter = symbols_filter,
    --     })
    --   end,
    --   desc = "Goto Symbol",
    -- },
    -- {
    --   "<leader>sS",
    --   function()
    --     require("fzf-lua").lsp_live_workspace_symbols({
    --       regex_filter = symbols_filter,
    --     })
    --   end,
    --   desc = "Goto Symbol (Workspace)",
    -- },
  },
}
