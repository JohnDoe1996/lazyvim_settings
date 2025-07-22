return {
  {
    "neovim/nvim-lspconfig",
    dependencies = "williamboman/mason-lspconfig.nvim",
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = "williamboman/mason.nvim",
    version = "^1.0.0",
  },
  {
    "mason-org/mason.nvim",
    version = "^1.0.0",
    opts = {
      ensure_installed = {
        -- pyrhon
        "pyright",
        "flake8",
        "jinja-lsp",
        "django-template-lsp",

        -- java
        "java-language-server",

        -- go
        "gopls",

        -- rust
        "rust-analyzer",
        "rustfmt",

        -- c/c++
        "clangd",

        -- c#
        "csharp-language-server",
        "omnisharp",

        -- vue
        "vue-language-server",

        -- jq
        "jq-lsp",

        -- lua
        "stylua",

        -- shell
        "shellcheck",
        "shfmt",

        -- docker
        "docker-compose-language-service",
        "dockerfile-language-server",

        -- json
        "json-lsp",

        -- yaml
        "yamlfmt",

        -- install any other package
        "tree-sitter-cli",
        "ast-grep",
        "harper-ls",
      },
    },
  },
}
