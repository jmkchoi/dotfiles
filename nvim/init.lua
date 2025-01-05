require("config.lazy")

vim.cmd("set clipboard=unnamedplus")

if vim.g.vscode then
  -- VSCode extension
  require("user.vscode_keymaps")
else
  -- ordinary Neovim
  -- settings
  vim.cmd("set expandtab")
  vim.cmd("set tabstop=2")
  vim.cmd("set softtabstop=2")
  vim.cmd("set shiftwidth=2")
  vim.cmd("set number")
  vim.cmd("set nu")
  vim.cmd("set cursorline")
  vim.cmd("set cursorlineopt=number")
  vim.cmd("set statusline=%t")

  -- style
  require("catppuccin").setup()
  vim.cmd.colorscheme = "catppuccin"

  -- keymappings
  vim.keymap.set('i', '<C-j>', '<Down>')
  vim.keymap.set('i', '<C-k>', '<Up>')
  vim.keymap.set('i', '<C-l>', '<Right>')
  vim.keymap.set('i', '<C-h>', '<Left>')
  vim.keymap.set('i', 'jk', '<Esc>')
  vim.keymap.set('i', '..', '->')
  vim.keymap.set('i', '<a-j>', '<Esc>:m .+1<CR>==gi')
  vim.keymap.set('i', '<a-k>', '<Esc>:m .-2<CR>==gi')
  vim.keymap.set('i', '<a-S-j>', '<Esc>:t.<CR>==gi<Down>')

  vim.keymap.set('v', 'i', '<Esc>i')
  vim.keymap.set('v', '<Tab>', '>gv')
  vim.keymap.set('v', '<S-Tab>', '<gv')
  vim.keymap.set('v', '<a-j>', ":m '>+1<CR>==gv=gv")
  vim.keymap.set('v', '<a-k>', ":m '<-2<CR>==gv=gv")

  vim.keymap.set('n', '<Tab>', '>>')
  vim.keymap.set('n', '<S-Tab>', '<<')
  vim.keymap.set('n', 'd', '"_d')
  vim.keymap.set('n', 'D', '"_D')
  vim.keymap.set('n', 'dd', '"_dd')
  vim.keymap.set('n', '<a-j>', ':m .+1<CR>==')
  vim.keymap.set('n', '<a-k>', ':m .-2<CR>==')
  vim.keymap.set('n', '<C-l>', '<C-w><C-l>')
  vim.keymap.set('n', '<C-k>', '<C-w><C-l>')
  vim.keymap.set('n', '<C-j>', '<C-w><C-j>')
  vim.keymap.set('n', '<C-h>', '<C-w><C-h>')
  vim.keymap.set('n', '<a-S-j>', ':t.<CR>==')

  -- cmd mappings
  vim.keymap.set('n', '<D-s>', ':w<CR>') -- Save
  vim.keymap.set('n', '<D-c>', '"+y$')
  vim.keymap.set('n', '<D-z>', 'u')
  vim.keymap.set('i', '<D-z>', '<Esc>u<CR>==gi')
  vim.keymap.set('x', '<D-c>', '"+y')
  vim.keymap.set('n', '<D-v>', '"*P') -- Paste normal mode
  vim.keymap.set('v', '<D-v>', '"*P') -- Paste visual mode
  vim.keymap.set('c', '<D-v>', '<C-R>+') -- Paste command mode
  vim.keymap.set('i', '<D-v>', '<Esc>l"+Pli') -- Paste insert mode

  -- fzf
  require("fzf-lua").setup({
    defaults = {
      git_icons = false,
      file_icons = false,
      color_icons = false,
    }
  })

  vim.keymap.set('n', '<C-p>', require("fzf-lua").files, { desc = "fzf files" })

  -- comment
  require('Comment').setup()

  vim.keymap.set("n", "<D-/>", "gcc", { remap = true })
  vim.keymap.set("v", "<D-/>", "gbc", { remap = true })

  -- colorizer
  vim.opt.termguicolors = true
  require("colorizer").setup()

  -- treesitter
  -- require("nvim-treesitter").setup({
  --   ensure_installed = { "lua", "vim", "vimdoc", "query", "javascript", "html" },
  --   highlight = { enable = true },
  --   indent = { enable = true },  
  -- })

  -- tabby
  local theme = {
    fill = 'TabLineFill',
    -- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
    head = 'TabLine',
    -- current_tab = 'TabLineSel',
    current_tab = { fg = '#F8FBF6', bg = '#896a98', style = 'bold' },
    tab = 'TabLine',
    win = 'TabLine',
    tail = 'TabLine',
  }

  require('tabby.tabline').set(function(line)
    return {
      {
        { '  ', hl = theme.head },
        line.sep('', theme.head, theme.fill),
      },
      line.tabs().foreach(function(tab)
        local hl = tab.is_current() and theme.current_tab or theme.tab
        return {
          line.sep('', hl, theme.fill),
          tab.is_current() and '' or '○',
          tab.number(),
          tab.name(),
          -- tab.close_btn(''), -- show a close button
          line.sep('', hl, theme.fill),
          hl = hl,
          margin = ' ',
        }
      end),
      line.spacer(),
      -- shows list of windows in tab
      -- line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
      --   return {
      --     line.sep('', theme.win, theme.fill),
      --     win.is_current() and '' or '○',
      --     win.buf_name(),
      --     line.sep('', theme.win, theme.fill),
      --     hl = theme.win,
      --     margin = ' ',
      --   }
      -- end),
      {
        line.sep('', theme.tail, theme.fill),
        { '  ', hl = theme.tail },
      },
      hl = theme.fill,
    }
  end)
end


