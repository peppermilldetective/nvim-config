return {
    {
        'rcarriga/nvim-notify',
        config = function()
            require('notify').setup({
                stages = 'slide',
                background_colour = 'FloatShadow',
                timeout = 3000,
                merge_duplicates = true,
                fps = 30,
            })

            vim.notify = require('notify')
        end,
    },
}
