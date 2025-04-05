-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim
-- https://www.reddit.com/r/neovim/comments/yckqsn/how_to_disable_netrw_in_favor_of_own_plugin/
-- vim.g.loaded_netrwPlugin = 1
-- vim.g.loaded_netrw = 1

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    buffers = {
      follow_current_file = {
        enabled = true, -- This will find and focus the file in the active buffer every time
        --              -- the current file is changed while the tree is open.
        leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
      },
    },
    filesystem = {
      window = {
        -- position = 'current',
        -- hijack_netrw_behavior = 'open_current',
        mappings = {
          ['\\'] = 'close_window',
          ['<D-b>'] = 'close_window',
        },
      },
    },
  },
  -- init = function()
  --   -- stop netrw from running on load https://github.com/nvim-neo-tree/neo-tree.nvim/issues/1247
  --   -- so neo-tree can be shown instead
  --   -- the remote file handling part
  --   vim.api.nvim_create_autocmd('BufEnter', {
  --     group = vim.api.nvim_create_augroup('RemoteFileInit', { clear = true }),
  --     callback = function()
  --       local f = vim.fn.expand '%:p'
  --       for _, v in ipairs { 'dav', 'fetch', 'ftp', 'http', 'rcp', 'rsync', 'scp', 'sftp' } do
  --         local p = v .. '://'
  --         if f:sub(1, #p) == p then
  --           vim.cmd [[
  --             unlet g:loaded_netrw
  --             unlet g:loaded_netrwPlugin
  --             runtime! plugin/netrwPlugin.vim
  --             silent Explore %
  --           ]]
  --           break
  --         end
  --       end
  --       vim.api.nvim_clear_autocmds { group = 'RemoteFileInit' }
  --     end,
  --   })
  --   vim.api.nvim_create_autocmd('BufEnter', {
  --     group = vim.api.nvim_create_augroup('NeoTreeInit', { clear = true }),
  --     callback = function()
  --       local f = vim.fn.expand '%:p'
  --       if vim.fn.isdirectory(f) ~= 0 then
  --         vim.cmd('Neotree current dir=' .. f)
  --         vim.api.nvim_clear_autocmds { group = 'NeoTreeInit' }
  --       end
  --     end,
  --   })
  -- end,
}
