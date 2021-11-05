#!/bin/bash
#
## My arch install
#

echo "=====:=====:===== ~~~~~~~ =====:=====:====="
sudo pacman -S --needed rsync lsof curl cmake wget perl

echo "=====:=====:=====   Java  =====:=====:====="
sudo pacman -S --needed jre{8,11,}-openjdk{,-headless} jdk{8,11,}-openjdk

echo "=====:=====:===== Kotlin  =====:=====:====="
sudo pacman -S --needed kotlin

echo "=====:=====:===== Node.js =====:=====:====="
sudo pacman -S --needed nodejs npm

echo "=====:=====:=====  Python =====:=====:====="
sudo pacman -S --needed python{,-pip,-setuptools,-wheel,-jedi} # python,-pipenv

echo "=====:=====:=====  Rust   =====:=====:====="
sudo pacman -S --needed rustup
rustup install stable
rustup default stable
rustup component add rls rust-analysis rust-src clippy rustfmt
sudo pacman -S --needed rust-racer

echo "=====:=====:===== Haskell =====:=====:====="
sudo pacman -S --needed ghc cabal-install stack

echo "=====:=====:=====   Go    =====:=====:====="
sudo pacman -S --needed go{,-tools}

echo "=====:=====:=====   Lua   =====:=====:====="
sudo pacman -S --needed lua{,jit,rocks}

echo "=====:=====:=====  Ruby   =====:=====:====="
sudo pacman -S --needed ruby{,-irb}

echo "=====:=====:=====  Mono   =====:=====:====="
sudo pacman -S --needed mono{,-tools}

echo "=====:=====:===== Gradle  =====:=====:====="
sudo pacman -S --needed gradle
