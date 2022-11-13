-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/sherlock/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/sherlock/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/sherlock/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/sherlock/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/sherlock/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["barbecue.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rbarbecue\frequire\0" },
    loaded = true,
    path = "/home/sherlock/.local/share/nvim/site/pack/packer/start/barbecue.nvim",
    url = "https://github.com/utilyre/barbecue.nvim"
  },
  ["cheatsheet.nvim"] = {
    loaded = true,
    path = "/home/sherlock/.local/share/nvim/site/pack/packer/start/cheatsheet.nvim",
    url = "https://github.com/sudormrfbin/cheatsheet.nvim"
  },
  ["coq.artifacts"] = {
    loaded = true,
    path = "/home/sherlock/.local/share/nvim/site/pack/packer/start/coq.artifacts",
    url = "https://github.com/ms-jpq/coq.artifacts"
  },
  ["coq.thirdparty"] = {
    loaded = true,
    path = "/home/sherlock/.local/share/nvim/site/pack/packer/start/coq.thirdparty",
    url = "https://github.com/ms-jpq/coq.thirdparty"
  },
  coq_nvim = {
    loaded = true,
    path = "/home/sherlock/.local/share/nvim/site/pack/packer/start/coq_nvim",
    url = "https://github.com/ms-jpq/coq_nvim"
  },
  ["crates.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vcrates\frequire\0" },
    loaded = true,
    path = "/home/sherlock/.local/share/nvim/site/pack/packer/start/crates.nvim",
    url = "https://github.com/saecki/crates.nvim"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/home/sherlock/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  fzf = {
    loaded = true,
    path = "/home/sherlock/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzf-lua"] = {
    loaded = true,
    path = "/home/sherlock/.local/share/nvim/site/pack/packer/start/fzf-lua",
    url = "https://github.com/ibhagwan/fzf-lua"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/home/sherlock/.local/share/nvim/site/pack/packer/start/fzf.vim",
    url = "https://github.com/junegunn/fzf.vim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/sherlock/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lsp-colors.nvim"] = {
    loaded = true,
    path = "/home/sherlock/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim",
    url = "https://github.com/folke/lsp-colors.nvim"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/home/sherlock/.local/share/nvim/site/pack/packer/start/lsp-status.nvim",
    url = "https://github.com/nvim-lua/lsp-status.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/sherlock/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n}\0\0\a\0\b\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0006\4\0\0'\6\3\0B\4\2\2=\4\5\3=\3\a\2B\0\2\1K\0\1\0\foptions\1\0\0\ntheme\1\0\0\28lualine.themes.ayu_dark\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/sherlock/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/sherlock/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/sherlock/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["neo-tree.nvim"] = {
    loaded = true,
    path = "/home/sherlock/.local/share/nvim/site/pack/packer/start/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  ["neovim-ayu"] = {
    loaded = true,
    path = "/home/sherlock/.local/share/nvim/site/pack/packer/start/neovim-ayu",
    url = "https://github.com/Shatur/neovim-ayu"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/sherlock/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-cokeline"] = {
    config = { "\27LJ\2\n^\0\1\5\1\4\0\0149\1\0\0\15\0\1\0X\2\6€-\1\0\0'\3\1\0'\4\2\0B\1\3\2\14\0\1\0X\2\4€-\1\0\0'\3\3\0'\4\2\0B\1\3\2L\1\2\0\0À\fComment\afg\vNormal\15is_focused/\0\1\2\0\3\1\a9\1\0\0\b\1\0\0X\1\2€'\1\1\0X\2\1€'\1\2\0L\1\2\0\5\bâ–\nindex\2-\0\1\3\0\3\0\5'\1\0\0009\2\1\0009\2\2\2&\1\2\1L\1\2\0\ticon\fdevicon\t    !\0\1\2\0\2\0\0039\1\0\0009\1\1\1L\1\2\0\ncolor\fdevicon%\0\1\3\0\2\0\0049\1\0\0'\2\1\0&\1\2\1L\1\2\0\t    \rfilename3\0\1\2\0\2\0\a9\1\0\0\15\0\1\0X\2\2€'\1\1\0X\2\1€+\1\0\0L\1\2\0\tbold\15is_focusedÝ\2\1\0\n\0\24\0+6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0029\1\4\0015\3\b\0005\4\6\0003\5\5\0=\5\a\4=\4\t\0034\4\6\0005\5\v\0003\6\n\0=\6\f\5\18\6\0\0'\b\r\0'\t\a\0B\6\3\2=\6\a\5>\5\1\0045\5\15\0003\6\14\0=\6\f\0053\6\16\0=\6\a\5>\5\2\0045\5\18\0003\6\17\0=\6\f\0053\6\19\0=\6\20\5>\5\3\0045\5\21\0>\5\4\0045\5\22\0>\5\5\4=\4\23\3B\1\2\0012\0\0€K\0\1\0\15components\1\0\1\ttext\a  \1\0\2 delete_buffer_on_left_click\2\ttext\bï™•\nstyle\0\1\0\0\0\0\1\0\0\0\vNormal\ttext\1\0\0\0\15default_hl\1\0\0\afg\1\0\1\abg\tNONE\0\nsetup\rcokeline\fget_hex\19cokeline/utils\frequire\0" },
    loaded = true,
    path = "/home/sherlock/.local/share/nvim/site/pack/packer/start/nvim-cokeline",
    url = "https://github.com/noib3/nvim-cokeline"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/sherlock/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-lspfuzzy"] = {
    loaded = true,
    path = "/home/sherlock/.local/share/nvim/site/pack/packer/start/nvim-lspfuzzy",
    url = "https://github.com/ojroques/nvim-lspfuzzy"
  },
  ["nvim-navic"] = {
    loaded = true,
    path = "/home/sherlock/.local/share/nvim/site/pack/packer/start/nvim-navic",
    url = "https://github.com/smiteshp/nvim-navic"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/sherlock/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/sherlock/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/sherlock/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/sherlock/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/sherlock/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/sherlock/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/sherlock/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\nQ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\vheight\3\15\15auto_close\2\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/home/sherlock/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["venn.nvim"] = {
    config = { "\27LJ\2\n±\4\0\0\b\0\28\0K6\0\0\0009\0\1\0006\2\0\0009\2\2\0029\2\3\2B\0\2\2\a\0\4\0X\0016€6\1\0\0009\1\2\1+\2\2\0=\2\3\0016\1\0\0009\1\5\1'\3\6\0B\1\2\0016\1\0\0009\1\a\0019\1\b\1)\3\0\0'\4\t\0'\5\n\0'\6\v\0005\a\f\0B\1\6\0016\1\0\0009\1\a\0019\1\b\1)\3\0\0'\4\t\0'\5\r\0'\6\14\0005\a\15\0B\1\6\0016\1\0\0009\1\a\0019\1\b\1)\3\0\0'\4\t\0'\5\16\0'\6\17\0005\a\18\0B\1\6\0016\1\0\0009\1\a\0019\1\b\1)\3\0\0'\4\t\0'\5\19\0'\6\20\0005\a\21\0B\1\6\0016\1\0\0009\1\a\0019\1\b\1)\3\0\0'\4\22\0'\5\23\0'\6\24\0005\a\25\0B\1\6\1X\1\f€6\1\0\0009\1\5\1'\3\26\0B\1\2\0016\1\0\0009\1\5\1'\3\27\0B\1\2\0016\1\0\0009\1\2\1+\2\0\0=\2\3\1K\0\1\0\22mapclear <buffer>\17setlocal ve=\1\0\1\fnoremap\2\14:VBox<CR>\6f\6v\1\0\1\fnoremap\2\20<C-v>h:VBox<CR>\6H\1\0\1\fnoremap\2\20<C-v>l:VBox<CR>\6L\1\0\1\fnoremap\2\20<C-v>k:VBox<CR>\6K\1\0\1\fnoremap\2\20<C-v>j:VBox<CR>\6J\6n\24nvim_buf_set_keymap\bapi\20setlocal ve=all\bcmd\bnil\17venn_enabled\6b\finspect\bvimÐ\1\1\0\6\0\14\0\0206\0\0\0003\1\2\0=\1\1\0006\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\n\0'\3\v\0'\4\f\0005\5\r\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\14:VBox<CR>\14<leader>b\6v\1\0\1\fnoremap\2\27:lua Toggle_venn()<CR>\14<leader>v\6n\20nvim_set_keymap\bapi\bvim\0\16Toggle_venn\a_G\0" },
    loaded = true,
    path = "/home/sherlock/.local/share/nvim/site/pack/packer/start/venn.nvim",
    url = "https://github.com/jbyuki/venn.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\nQ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\vheight\3\15\15auto_close\2\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: nvim-cokeline
time([[Config for nvim-cokeline]], true)
try_loadstring("\27LJ\2\n^\0\1\5\1\4\0\0149\1\0\0\15\0\1\0X\2\6€-\1\0\0'\3\1\0'\4\2\0B\1\3\2\14\0\1\0X\2\4€-\1\0\0'\3\3\0'\4\2\0B\1\3\2L\1\2\0\0À\fComment\afg\vNormal\15is_focused/\0\1\2\0\3\1\a9\1\0\0\b\1\0\0X\1\2€'\1\1\0X\2\1€'\1\2\0L\1\2\0\5\bâ–\nindex\2-\0\1\3\0\3\0\5'\1\0\0009\2\1\0009\2\2\2&\1\2\1L\1\2\0\ticon\fdevicon\t    !\0\1\2\0\2\0\0039\1\0\0009\1\1\1L\1\2\0\ncolor\fdevicon%\0\1\3\0\2\0\0049\1\0\0'\2\1\0&\1\2\1L\1\2\0\t    \rfilename3\0\1\2\0\2\0\a9\1\0\0\15\0\1\0X\2\2€'\1\1\0X\2\1€+\1\0\0L\1\2\0\tbold\15is_focusedÝ\2\1\0\n\0\24\0+6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0029\1\4\0015\3\b\0005\4\6\0003\5\5\0=\5\a\4=\4\t\0034\4\6\0005\5\v\0003\6\n\0=\6\f\5\18\6\0\0'\b\r\0'\t\a\0B\6\3\2=\6\a\5>\5\1\0045\5\15\0003\6\14\0=\6\f\0053\6\16\0=\6\a\5>\5\2\0045\5\18\0003\6\17\0=\6\f\0053\6\19\0=\6\20\5>\5\3\0045\5\21\0>\5\4\0045\5\22\0>\5\5\4=\4\23\3B\1\2\0012\0\0€K\0\1\0\15components\1\0\1\ttext\a  \1\0\2 delete_buffer_on_left_click\2\ttext\bï™•\nstyle\0\1\0\0\0\0\1\0\0\0\vNormal\ttext\1\0\0\0\15default_hl\1\0\0\afg\1\0\1\abg\tNONE\0\nsetup\rcokeline\fget_hex\19cokeline/utils\frequire\0", "config", "nvim-cokeline")
time([[Config for nvim-cokeline]], false)
-- Config for: crates.nvim
time([[Config for crates.nvim]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vcrates\frequire\0", "config", "crates.nvim")
time([[Config for crates.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n}\0\0\a\0\b\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0006\4\0\0'\6\3\0B\4\2\2=\4\5\3=\3\a\2B\0\2\1K\0\1\0\foptions\1\0\0\ntheme\1\0\0\28lualine.themes.ayu_dark\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: barbecue.nvim
time([[Config for barbecue.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rbarbecue\frequire\0", "config", "barbecue.nvim")
time([[Config for barbecue.nvim]], false)
-- Config for: venn.nvim
time([[Config for venn.nvim]], true)
try_loadstring("\27LJ\2\n±\4\0\0\b\0\28\0K6\0\0\0009\0\1\0006\2\0\0009\2\2\0029\2\3\2B\0\2\2\a\0\4\0X\0016€6\1\0\0009\1\2\1+\2\2\0=\2\3\0016\1\0\0009\1\5\1'\3\6\0B\1\2\0016\1\0\0009\1\a\0019\1\b\1)\3\0\0'\4\t\0'\5\n\0'\6\v\0005\a\f\0B\1\6\0016\1\0\0009\1\a\0019\1\b\1)\3\0\0'\4\t\0'\5\r\0'\6\14\0005\a\15\0B\1\6\0016\1\0\0009\1\a\0019\1\b\1)\3\0\0'\4\t\0'\5\16\0'\6\17\0005\a\18\0B\1\6\0016\1\0\0009\1\a\0019\1\b\1)\3\0\0'\4\t\0'\5\19\0'\6\20\0005\a\21\0B\1\6\0016\1\0\0009\1\a\0019\1\b\1)\3\0\0'\4\22\0'\5\23\0'\6\24\0005\a\25\0B\1\6\1X\1\f€6\1\0\0009\1\5\1'\3\26\0B\1\2\0016\1\0\0009\1\5\1'\3\27\0B\1\2\0016\1\0\0009\1\2\1+\2\0\0=\2\3\1K\0\1\0\22mapclear <buffer>\17setlocal ve=\1\0\1\fnoremap\2\14:VBox<CR>\6f\6v\1\0\1\fnoremap\2\20<C-v>h:VBox<CR>\6H\1\0\1\fnoremap\2\20<C-v>l:VBox<CR>\6L\1\0\1\fnoremap\2\20<C-v>k:VBox<CR>\6K\1\0\1\fnoremap\2\20<C-v>j:VBox<CR>\6J\6n\24nvim_buf_set_keymap\bapi\20setlocal ve=all\bcmd\bnil\17venn_enabled\6b\finspect\bvimÐ\1\1\0\6\0\14\0\0206\0\0\0003\1\2\0=\1\1\0006\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\n\0'\3\v\0'\4\f\0005\5\r\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\14:VBox<CR>\14<leader>b\6v\1\0\1\fnoremap\2\27:lua Toggle_venn()<CR>\14<leader>v\6n\20nvim_set_keymap\bapi\bvim\0\16Toggle_venn\a_G\0", "config", "venn.nvim")
time([[Config for venn.nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
