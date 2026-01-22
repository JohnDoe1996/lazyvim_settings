return {
  'uga-rosa/translate.nvim',
  config = function()
    require('translate').setup({
      output = {
        float_win = {
          max_width = 40,
          max_height = 5,
          close_on_cursor_move = true,
        },
        clipboard = true,
        insert = true,
        notify = true,
      },
      engines = {
        'google',
        'bing',
      },
    })
  end
}
