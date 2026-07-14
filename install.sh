#! /usr/bin/env bash

for f in .vimrc .wezterm.lua .zprofile .zshrc .zshenv; do
  ln -sf "$PWD/$f" ~/$f
done

for f in nvim starship.toml uv clangd; do
  ln -sf "$PWD/.config/$f" ~/.config/$f
done

