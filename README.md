# Dark Moon

A Neovim color scheme derived from [blue-moon](https://github.com/kyazdani42/blue-moon).

Dark Moon supports Treesitter, built-in LSP client, true-color terminals,
and [other supported plugins](#supported-plugins).

![Neovim with Dark Moon color scheme](https://github.com/user-attachments/assets/d036478a-5129-4820-87ea-32dd245c57d6)

## Requirements

- Neovim version should be newer than 0.8.0.
- Terminal emulator with [true-color supported](https://github.com/termstandard/colors#truecolor-support-in-output-devices).

## Installation

With [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
-- Install without configuration
{ "wwiyoko/dark-moon" }

-- Or with configuration
{
    "wwiyoko/dark-moon",
    lazy = false, -- Load at startup if it is your main color scheme
    priority = 1000, -- Load this first before other plugins
    config = function()
        require("dark-moon").setup({
            -- Your configuration will be here
        })

        vim.cmd.colorscheme("dark-moon")
    end
}
```

## Usage

Using built-in `:colorscheme` command:

```vim
colorscheme dark-moon
```

Using Lua:

```lua
vim.cmd.colorscheme("dark-moon")

-- Or

require("dark-moon").load()
```

## Configuration

Setup options are optional; Dark Moon will use default values for setup
options. Below is the default configuration:

```lua
require("dark-moon").setup({
    terminal_colors = true, -- Set terminal colors used in `:terminal`
    styles = {
        bold = true,
        italic = false
    },
    overrides = {} -- Override any style of highlight groups
})
```

An example of overriding the style of highlight groups:

```lua
require("dark-moon").setup({
    overrides = {
        TelescopeTitle = {
            fg = "#ffffff",
            bg = "#000000",
            bold = false,
            italic = true,
            underline = true,
            undercurl = false
        }
    }
})
```

## Supported Plugins

- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
- [which-key.nvim](https://github.com/folke/which-key.nvim)
- [nvim-notify](https://github.com/rcarriga/nvim-notify)
- [dashboard-nvim](https://github.com/nvimdev/dashboard-nvim)
- [oil.nvim](https://github.com/stevearc/oil.nvim)
- [mason.nvim](https://github.com/williamboman/mason.nvim)
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)

  ```lua
  require("lualine").setup({
      options = {
          theme = "dark-moon"
      }
  })
  ```

- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)

  ```lua
  require("bufferline").setup({
      options = {
          themable = true
      },
      highlights = require("dark-moon.highlights.plugins.bufferline")
  })
  ```

- [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)

  ```lua
  require("toggleterm").setup({
      highlights = require("dark-moon.highlights.plugins.toggleterm")
  })
  ```

These plugins do not need to be overridden or customized, since
they have nice default highlight groups that match the Dark Moon:

- [lazy.nvim](https://github.com/folke/lazy.nvim)
- [trouble.nvim](https://github.com/folke/trouble.nvim)
- [lsp_signature.nvim](https://github.com/ray-x/lsp_signature.nvim)
- [diffview.nvim](https://github.com/sindrets/diffview.nvim)

## Acknowledgements

- [kyazdani42](https://github.com/kyazdani42) for [blue-moon](https://github.com/kyazdani42/blue-moon)
- [AlexvZyl](https://github.com/AlexvZyl) for [nordic.nvim](https://github.com/AlexvZyl/nordic.nvim)
