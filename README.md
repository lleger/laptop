# Laptop Setup

This repo contains some of the dotfiles and other configuration that I use to
customize my laptop setup.

## Manual Install

A few dependencies must be installed manually. It's best to install these via their current recommendation. Refer to the appropriate docs.

- [asdf][asdf install] for runtime version management
- [Homebrew][homebrew install] for installing dependencies
- [awscli][awscli install] for working with AWS (Homebrew's version isn't maintained by AWS)
- [Docker for Mac][docker install]
- [New Moon] terminal theme
- [tpm] for tmux plugins
- [zgen] for Zsh plugins

[asdf install]: https://asdf-vm.com/#/core-manage-asdf?id=install
[homebrew install]: https://docs.brew.sh/Installation
[awscli install]: https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-mac.html#cliv2-mac-install-cmd 
[docker install]: https://docs.docker.com/docker-for-mac/install/
[new moon]: https://github.com/taniarascia/new-moon/tree/master/Terminal.app

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

    asdf plugin-add erlang
    asdf plugin-add elixir # install Erlang first
    asdf plugin-add nodejs
    asdf plugin-add packer 
    asdf plugin-add ruby
    asdf plugin-add terraform 

    asdf install erlang latest
    asdf install elixir latest
    asdf install nodejs latest
    asdf install packer latest
    asdf install ruby latest
    asdf install terraform latest

    asdf global erlang [latest]
    asdf global elixir [latest]
    asdf global nodejs [latest]
    asdf global packer [latest]
    asdf global ruby [latest]
    asdf global terraform [latest]

## VSCode

This is how I configure [VSCode], my default text editor.

First, copy `settings.json` into VSCode's preferences pane.

Second, install all of the extensions listed.

## Etc

There are some other miscellaneous Markdown files explaining other
customizations I do. See those for more information.

[asdf]: https://github.com/asdf-vm/asdf
[bundle file]: https://github.com/Homebrew/homebrew-bundle
[homebrew]: http://brew.sh
[oh my zsh]: https://ohmyz.sh
[vim plug]: https://github.com/junegunn/vim-plug
[vscode]: https://code.visualstudio.com
