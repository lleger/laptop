# Laptop Setup

This repo contains some of the dotfiles and other configuration that I use to
customize my laptop setup.

## Prerequisites

In order to complete installation a few prerequisites should be installed:

- [Homebrew]
- [Oh My Zsh]
- [Vim Plug]

Everything else should be handled either by Homebrew or is listed for manual
install in `./apps.md`.

## Apps

This file lists all of the apps I rely on and specifies where to install them
from.

## Brewfile

This [bundle file] contains all of the [Homebrew] packages I use. With Homebrew
installed, run the following command to install the bundle:

    brew bundle

## Dotfiles

These are all of the dotfiles (i.e., configuration files) that I use. Copy them
with a leading `.` to `~/` to install. Or run the script to do it all at once:

    ./dotfiles.sh

## Language Versions

I use [asdf] to manage versions of the programming langues I work in. After
installing asdf (included in the Homebrew bundle), install the plugins and
latest verions:

    asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
    asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
    asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
    asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git

    asdf install erlang 21.0.7  # or latest
    asdf install elixir 1.7.3   # or latest
    asdf install nodejs 10.9.0  # or latest
    asdf install ruby 2.5.1     # or latest

    asdf global erlang 21.0.7   # or latest
    asdf global elixir 1.7.3    # or latest
    asdf global nodejs 10.9.0   # or latest
    asdf global ruby 2.5.1      # or latest

## VSCode

This is how I configure [VSCode], my default text editor.

First, copy `settings.json` into VSCode's preferences pane.

Second, install all of the extensions listed.

## Config

These are config files used with some Homebrew packages. It describes how I set
up my web develoment environment with dnsmasq and nginx.

## Etc

There are some other miscellaneous Markdown files explaining other
customizations I do. See those for more information.

[asdf]: https://github.com/asdf-vm/asdf
[bundle file]: https://github.com/Homebrew/homebrew-bundle
[homebrew]: http://brew.sh
[oh my zsh]: https://ohmyz.sh
[vim plug]: https://github.com/junegunn/vim-plug
[vscode]: https://code.visualstudio.com
