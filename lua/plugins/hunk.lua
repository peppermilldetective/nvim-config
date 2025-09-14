return {
    'julienvincent/hunk.nvim',
    cmd = { 'DiffEditor' },
    opts = {},
    config = function(_, opts)
        require('hunk').setup(opts)
    end,
}
