# My Neovim Config

## Install

```
cd ~/.config  # or create it and cd to it
git@github.com:digitalronin/neovim-config.git nvim
mkdir -p nvim/tmp/backup nvim/tmp/swap nvim/tmp/undo
```

Then run `nvim`

The first invocation will show an error - this run sets up `vim-plug`. Run `nvim` again.

The next invocation should not show an error. From within neovim, run
`:PlugInstall` to download all the plugins (this can take a long time,
especially setting up `vim-go`).
