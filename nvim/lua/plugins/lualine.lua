return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      -- set an empty statusline till lualine loads
      vim.o.statusline = " "
    else
      -- hide the statusline on the starter page
      vim.o.laststatus = 0
    end
  end,
  opts = function()
    -- PERF: we don't need this lualine require madness 🤷
    local lualine_require = require("lualine_require")
    lualine_require.require = require

    local icons = LazyVim.config.icons

    vim.o.laststatus = vim.g.lualine_laststatus

    local opts = {
      options = {
        theme = "auto",
        globalstatus = vim.o.laststatus == 3,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter" } },
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          {
            "branch",
            separator = { left = "", right = "" },
            color = { bg = "#7f8490", fg = "#181819", gui = "bold" },
          },
          {
            "filename",
            file_status = true,
            path = 1,
            color = { bg = "#b39df3", fg = "#181819", gui = "bold" },
            separator = { left = "", right = "" },
          },
        },
        lualine_c = {
          LazyVim.lualine.root_dir(),
          {
            "diff",
            symbols = {
              added = icons.git.added,
              modified = icons.git.modified,
              removed = icons.git.removed,
            },
            source = function()
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed,
                }
              end
            end,
          },
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
        },
        lualine_x = {
          -- Show pressed keys
          {
            require("noice").api.status.command.get,
            cond = require("noice").api.status.command.has,
            color = { fg = "#ff9e64" },
          },

          -- stylua: ignore
          -- Show when macro is being recorded
          -- Customized from https://www.reddit.com/r/neovim/comments/18r2bxo/comment/keze7b9/
          {
            function()
              local reg = vim.fn.reg_recording()
              if reg == "" then return "" end -- not recording
              return "recording to " .. reg
            end,
            color = { bg = "#fc5d7c", fg = "#181819", gui = "bold" },
            separator = { left = "", right = "" },
          },
          {
            "filetype",
            icon_only = false,
            separator = { left = "", right = "" },
            padding = { left = 1, right = 1 },
          },
        },
        lualine_y = {
          {
            "searchcount",
            color = { bg = "#fc5d7c", fg = "#181819", gui = "bold" },
            separator = { left = "", right = "" },
          },
          {
            "progress",
            separator = { left = "", right = "" },
            padding = { left = 1, right = 1 },
          },
          {
            "location",
            padding = { left = 0, right = 1 },
          },
          {
            function()
              local fn = vim.fn
              local isVisualMode = fn.mode():find("[Vv]") ~= nil
              if not isVisualMode then
                return ""
              end
              local starts = fn.line("v")
              local ends = fn.line(".")
              local lines = starts <= ends and ends - starts + 1 or starts - ends + 1
              return " " .. tostring(lines) .. "L " .. tostring(fn.wordcount().visual_chars) .. "C"
            end,
            cond = function()
              return vim.fn.mode():find("[Vv]") ~= nil
            end,
            padding = { left = 1, right = 1 },
            color = { bg = "#fc5d7c", fg = "#181819", gui = "bold" },
            separator = { left = "", right = "" },
          },
        },
        lualine_z = {
          {
            function()
              return os.date("%R")
            end,
          },
        },
      },
      extensions = { "neo-tree", "lazy" },
    }

    return opts
  end,
}
