<div align="center">
  <img src="https://user-images.githubusercontent.com/292349/213446185-2db63fd5-8c84-459c-9f04-e286382d6e80.png">
</div>

<hr>

My daily-driver Neovim setup, built on [LazyVim](https://lazyvim.github.io/) and tuned for work across Python, Go, Kubernetes, Terraform, and more.

## What You Get

- **Catppuccin theme** that auto-switches between light (latte) and dark (mocha) based on your macOS appearance
- **15+ language extras** with LSP, formatting, linting, and snippets out of the box
- **Super-tab completion** via blink.cmp — tab through suggestions, snippets expand inline
- **Built-in tool terminals** for K9s, lazydocker, and posting (API client) — only shows up if you have them installed
- **Auto-save** on every change — no more `:w` muscle memory needed
- **Database UI** via Dadbod for running queries without leaving the editor
- **Git blame** inline with commit summaries, dates, and authors

## Prerequisites

| Tool             | Purpose           | Install                                       |
| ---------------- | ----------------- | --------------------------------------------- |
| **Neovim 0.10+** | Editor            | [neovim.io](https://neovim.io)                |
| **Git**          | Plugin management | Required                                      |
| **ripgrep**      | Fast search       | `brew install ripgrep`                        |
| **fd**           | File finding      | `brew install fd`                             |
| **yamlfmt**      | YAML formatting   | `go install github.com/google/yamlfmt@latest` |
| **sqruff**       | SQL formatting    | Optional                                      |
| **k9s**          | Kubernetes TUI    | Optional — `brew install k9s`                 |
| **lazydocker**   | Docker TUI        | Optional — `brew install lazydocker`          |

## Project Layout

```
~/.config/nvim/
├── init.lua                  # Entry point — bootstraps lazy.nvim
├── .lazy.lua                 # Extra lazy config + DB connections
├── lazyvim.json              # Enabled LazyVim extras
├── lazy-lock.json            # Pinned plugin versions
├── stylua.toml               # Lua formatter settings
│
├── snippets/                 # Custom LuaSnip snippets
│   ├── kubernetes.json       # K8s manifests (deployment, service, ingress, etc.)
│   ├── python.json           # main, requests, logging, SFTP, classes
│   ├── javascript.json       # React, TypeScript, fetch patterns
│   ├── dockerfile.json       # Production Dockerfile with uv
│   └── package.json          # Snippet registration
│
└── lua/
    ├── config/
    │   ├── lazy.lua          # Plugin manager setup
    │   ├── options.lua       # Editor options + macOS dark mode detection
    │   ├── keymaps.lua       # Custom keybindings
    │   └── autocmds.lua      # Auto-save and other autocommands
    └── plugins/
        ├── colorschema.lua   # Catppuccin + alternate themes
        ├── codediff.lua      # Side-by-side diff viewer
        ├── git-blame.lua     # Inline git blame
        └── custom/           # Plugin overrides
            ├── blink.lua     # Completion (super-tab preset)
            ├── conform.lua   # Formatters (yamlfmt, sqruff)
            ├── lualine.lua   # Status line styling
            ├── nvim-lint.lua # Linter config (yamllint)
            ├── snacks.lua    # Dashboard, picker, dim, image
            └── which-key.lua # Tool group registration
```

## Language Support

This config enables a lot of LazyVim language extras. Here's what's wired up:

| Language      | LSP                  | Formatter     | Linter   |
| ------------- | -------------------- | ------------- | -------- |
| Python        | ty (Astral)          | ruff          | ruff     |
| Go            | gopls                | gofumpt       | —        |
| Rust          | rust-analyzer        | rustfmt       | —        |
| TypeScript/JS | ts_ls                | prettier      | eslint   |
| Tailwind CSS  | tailwindcss          | prettier      | —        |
| YAML          | yamlls               | yamlfmt       | yamllint |
| JSON          | jsonls               | prettier      | —        |
| TOML          | taplo                | taplo         | —        |
| SQL           | sqlls                | sqruff        | —        |
| Docker        | dockerls             | —             | —        |
| Terraform     | terraformls          | terraform fmt | —        |
| Helm          | helm_ls              | —             | —        |
| Markdown      | marksman             | prettier      | —        |
| Java          | jdtls                | —             | —        |
| Lua           | lua_ls (via LazyVim) | stylua        | —        |

> **Note:** Python uses [ty](https://github.com/astral-sh/ty), Astral's type checker — not pyright. This is set via `vim.g.lazyvim_python_lsp = "ty"` in `options.lua`.

## Keybindings

### Custom Mappings

| Key               | Mode                   | What it does                              |
| ----------------- | ---------------------- | ----------------------------------------- |
| `jj` / `jk`       | Insert                 | Escape to normal mode                     |
| `aa`              | Normal                 | Jump to end of line and enter insert mode |
| `Alt+j` / `Alt+k` | Normal, Insert, Visual | Move line(s) up/down                      |

### Tool Terminals (`<leader>t`)

These only appear if the tool is installed on your system:

| Key          | Tool             |
| ------------ | ---------------- |
| `<leader>tk` | K9s (Kubernetes) |
| `<leader>td` | lazydocker       |
| `<leader>tg` | GH-Dash          |

### Handy LazyVim Defaults

| Key          | Action                                         |
| ------------ | ---------------------------------------------- |
| `<leader>`   | Which-key popup (shows all available bindings) |
| `<leader>ff` | Find files                                     |
| `<leader>sg` | Live grep                                      |
| `<leader>gb` | Git branches                                   |
| `<leader>gc` | Git commits                                    |
| `<leader>xx` | Toggle Trouble diagnostics                     |

## Snippets

Custom snippets live in `snippets/` and are loaded via LuaSnip.

**Kubernetes** (`k8s-` prefix in YAML files): deployment, service, configmap, secret, ingress, statefulset, pvc, job, cronjob.

**Python**: `pmain` (main boilerplate), `req` (requests call), `sftp_` (paramiko SFTP), `logger` (logging setup), `classpy` (class template).

**Dockerfile**: `dockerfile-uv` — production multi-stage build with uv package manager.

**JavaScript/TypeScript**: 60+ snippets covering React components, TypeScript types, fetch patterns, and more.

## Database Integration

Database connections are configured in `.lazy.lua`. The SQL extra gives you:

- `:DBUI` to open the Dadbod database browser
- Auto-completion for table/column names in SQL buffers
- Run queries and see results inline

See [lazyvim.org/extras/lang/sql](https://www.lazyvim.org/extras/lang/sql) for details.

## Notable Design Decisions

- **Aggressive auto-save** — every text change writes all buffers to disk. No unsaved state, ever.
- **macOS appearance sync** — reads `AppleInterfaceStyle` at startup to pick light/dark theme.
- **Conditional tool keymaps** — K9s and lazydocker bindings register when their binaries are on `$PATH`; GH-Dash works with either a `gh-dash` binary or the `gh dash` GitHub CLI extension.
- **yamlfmt over prettier for YAML** — better Kubernetes support (preserves comments, handles multi-doc files).
- **Prettier runs without config** — `lazyvim_prettier_needs_config = false`, so it formats even in projects without `.prettierrc`.

## Customization

### Add a plugin

Drop a file in `lua/plugins/`:

```lua
-- lua/plugins/myplugin.lua
return {
  "author/plugin-name",
  opts = {},
}
```

### Add a keybinding

Edit `lua/config/keymaps.lua`:

```lua
vim.keymap.set("n", "<leader>my", function()
  -- your action here
end, { desc = "My custom thing" })
```

### Change the theme

Edit `lua/plugins/colorschema.lua`. Dracula and boo-berry are already installed as alternates.

## Quick Reference

| Command        | What it does                            |
| -------------- | --------------------------------------- |
| `:Lazy`        | Open plugin manager                     |
| `:Lazy sync`   | Update all plugins                      |
| `:Mason`       | Manage LSP servers, formatters, linters |
| `:Checkhealth` | Run health checks                       |
| `:Format`      | Format current buffer                   |
| `:DBUI`        | Open database UI                        |
| `:CodeDiff`    | Side-by-side diff viewer                |

## Troubleshooting

**Plugins acting up?**

```
:Lazy clean
:Lazy sync
```

**LSP not working?**

```
:LspInfo        -- see what's attached
:LspStop        -- stop current servers
:LspStart       -- restart them
:Mason          -- check if the server is installed
```

---

Built on [LazyVim](https://lazyvim.github.io/) with [Catppuccin](https://github.com/catppuccin/nvim).
