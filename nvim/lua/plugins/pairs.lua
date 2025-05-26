-- Automatically inserts and manages matching pairs (e.g., (), {}, "") in Neovim.
-- Enhances coding efficiency by auto-completing and deleting paired characters, triggered on insert mode.

return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  config = true,
  opts = {},
}
