#! /usr/bin/env bash

for f in .gitconfig .gitignore .vimrc .zprofile .zshrc .zshenv; do
  ln -sf "$PWD/$f" ~/$f
done

for f in alacritty nvim starship.toml uv; do
  ln -sf "$PWD/$f" ~/.config.$f
done

