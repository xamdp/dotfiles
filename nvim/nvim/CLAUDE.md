# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Neovim configuration repository (dotfiles) managed with Git. The configuration uses **Lua** and the **lazy.nvim** plugin manager. It is part of a larger dotfiles collection that includes tmux, alacritty, i3, i3status, picom, x, feh, flameshot, and fcitx5—but this `nvim/` directory contains solely the Neovim setup.

## Architecture

- **Entry point**: `init.lua` loads configuration modules sequentially.
- **Core configuration**: `lua/config/` contains modular settings:
  - `options.lua`: global Neovim options (editor behavior, UI, diagnostics).
  - `keymaps.lua`: key mappings.
  - `autocmds.lua`: autocommands and LSP attach handler.
  - `dapconf.lua`: Debug Adapter Protocol configuration.
- **Plugin management**: `lua/core/lazy.lua` bootstraps `lazy.nvim` and declares the plugin specification.
- **Plugin configurations**: `lua/plugins/` contains one module per plugin or plugin group (e.g., `lsp.lua`, `telescope.lua`, `treesitter.lua`). All files in this directory are automatically imported by `lazy.lua` via `spec = { { import = "plugins" } }`.
- **Tree-sitter integration**: `package.json` includes `tree-sitter-cli` for generating or updating Tree-sitter parsers.

## Common Development Tasks

### Launch Neovim with this config
```bash
nvim
```

### Install/update/clean plugins
Inside Neovim:
```
:Lazy
```
Use `:Lazy install`, `:Lazy update`, `:Lazy sync`, `:Lazy clean`, etc.

### Manage LSP servers, DAP adapters, linters, formatters
Inside Neovim:
```
:Mason
```

### Check Neovim health
```
:checkhealth
```
Or run `nvim --headless +checkhealth` from the command line.

### Generate Tree-sitter parsers (when adding/modifying grammars)
```bash
npx tree-sitter generate
```
Run from the repo root or specify `--directory` to target a parser. Typically useful when working on `lua/plugins/treesitter.lua`.

### Inspect lazy.nvim performance profile
Inside Neovim: `:Lazy profile` to see plugin load times and configuration breakdown.

## Adding New Plugins

1. Create or edit a file in `lua/plugins/` (e.g., `lua/plugins/myplugin.lua`).
2. Return a table with one or more plugin specifications using lazy.nvim’s format:

```lua
return {
  {
    "user/repo",
    dependencies = { "other/plugin" },
    opts = { /* ... */ },
    config = function(_, opts)
      -- setup code
    end,
  },
}
```

3. If you create a new file, it will be automatically picked up by the `import = "plugins"` pattern.
4. Reload Neovim or run `:Lazy sync` to install/configure the plugin.

## Adding LSP Servers

- Add the server name to `ensure_installed` in `lua/plugins/lsp.lua` to have Mason install it automatically.
- Add a server configuration to the `servers` table (keyed by the LSP name) with options like `settings`, `on_attach`, `cmd`, etc.
- Mason handles installation; Neovim applies the configuration when the LSP attaches. Special cases (e.g., `jdtls`) may require separate setup logic.

## Validating Changes

- Start Neovim and verify the startup is clean (no error messages in `:messages`).
- Open files for which LSP servers are configured and confirm diagnostics, formatting, and keymaps work.
- Check plugin status with `:Lazy` to ensure all plugins are installed and configured.
- Run `:checkhealth` to detect missing external dependencies (e.g., `rg`, `fd`, `node`, language runtimes).
- For UI or plugin changes, interactively test the affected functionality.

## Notes and Conventions

- Leader keys: `mapleader` and `maplocalleader` are set to `<Space>`.
- Telescope is the primary fuzzy finder; keybindings use `<leader>sh`, `<leader>sk`, `<leader>?`, etc.
- `workspace-diagnostics.nvim` aggregates LSP diagnostics across a multi-file project.
- `otter.nvim` provides embedded LSP support in files like Markdown with code blocks.
- Tree-sitter powers syntax highlighting, folding, and incremental selection; parsers are installed via Mason.
- The DAP setup (`dapconf.lua`) relies on Mason-installed debug adapters; language-specific extensions are configured individually.
- The `autocmds.lua` sets up LSP keymaps on `LspAttach` and highlights yanked text.

## External Tools Required

Full functionality expects these binaries on `PATH`:
- `git` (plugin updates)
- `rg` (ripgrep) for Telescope
- `fd` (or `fdfind`) for Telescope
- `node`/`npm` (for tree-sitter and some LSPs)
- `python` (for Python LSPs)
- Language-specific tools: JDK (for `jdtls`), Maven/Gradle (Java exercises), PHP (for `phpactor`), etc.

Mason can install many LSPs, linters, and formatters, but core tools like `rg`, `fd`, and `node` must be installed separately.

## Performance Optimizations (Optional)

The current setup is already quite minimal. If you want to squeeze out more performance, consider these optional tweaks:

- [ ] **Disable unwanted built-ins**: uncomment `vim.g.loaded_netrw = 1` and `vim.g.loaded_netrwPlugin = 1` in `lua/config/options.lua` to prevent netrw from loading.
- [ ] **Reduce UI redraws**: add `vim.o.lazyredraw = true` to skip screen redraws during macros and complex commands.
- [ ] **Faster key codes**: set `vim.o.ttimeoutlen = 50` (currently only `timeoutlen` is set) for quicker recognition of terminal key codes.
- [ ] **Trim Tree-sitter parsers**: keep `ensure_installed` in `lua/plugins/treesitter.lua` to only the languages you actively use; fewer parsers = faster startup/updates.
- [ ] **Move swap/backup/undo to tmpfs**: set `vim.opt.directory`, `vim.opt.backupdir`, `vim.opt.undodir` to `/tmp` or `/dev/shm` for faster disk I/O.
- [ ] **Lazy.nvim cache**: add `performance = { cache = true }` to the `require("lazy").setup()` call in `lua/core/lazy.lua` to cache plugin loads between sessions.
- [ ] **Disable matchparen**: `vim.g.loaded_matchit = 1` if you don't use `%` jumping; reduces overhead on large files.
- [ ] **Session options**: add `vim.o.sessionoptions = vim.o.sessionoptions:gsub("options", "")` to avoid saving all options in sessions (keeps sessions portable and lean).

These are low-risk, reversible tweaks. Apply only if you need extra responsiveness.

## Repository Structure

```
nvim/
├── init.lua
├── lazy-lock.json          # plugin version lock file
├── package.json            # dev dependency: tree-sitter-cli
├── lua/
│   ├── config/
│   │   ├── options.lua
│   │   ├── keymaps.lua
│   │   ├── autocmds.lua
│   │   └── dapconf.lua
│   ├── core/
│   │   └── lazy.lua
│   ├── plugins/
│   │   ├── autotag.lua
│   │   ├── colorschemes.lua
│   │   ├── completions.lua
│   │   ├── dap.lua
│   │   ├── diagnostics.lua
│   │   ├── essentials.lua
│   │   ├── formatting.lua
│   │   ├── harpoon.lua
│   │   ├── kulala.lua
│   │   ├── live-server.lua
│   │   ├── lspkind.lua
│   │   ├── lsp.lua
│   │   ├── lualine.lua
│   │   ├── luasnip.lua
│   │   ├── smear.lua
│   │   ├── telescope.lua
│   │   ├── treesitter.lua
│   │   ├── vim-tmux.lua
│   │   └── whichkey.lua
│   ├── jdtls/
│   │   └── jdtls_setup.lua
└── spell/                   # optional spell files
```
