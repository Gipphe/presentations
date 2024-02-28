---
marp: true
style: |
  section.top-aligned {
    justify-content: flex-start;
  }
---

# Nix

> The most ~~insane~~ powerful package manager you've ~~never~~ maybe heard of.
>
> &mdash; Me

---

## What

> Nix is a powerful package manager for Linux and other Unix systems that makes
> package management reliable and reproducible. It provides atomic upgrades and
> rollbacks, side-by-side installation of multiple versions of a package,
> multi-user package management and easy setup of build environments.
>
> &mdash; Copilot

---

<!-- _class: top-aligned -->

## Similar to

---

<!-- _class: top-aligned -->

## Similar to

- Poetry

---

<!-- _class: top-aligned -->

## Similar to

- Poetry
- nvm

---

<!-- _class: top-aligned -->

## Similar to

- Poetry
- nvm
- asdf

---

<!-- _class: top-aligned -->

## Similar to*

- Poetry
- nvm
- asdf

<!-- markdownlint-disable-next-line MD036 -->
_* 10% of it is at least_

---

## Nix is many things

- ~~Build system~~
- ~~Configuration tool~~
- ~~Package manager~~
- Developer environment manager

![bg right cover](https://github.com/Gipphe/presentations/blob/main/Nix/img/iceberg.webp?raw=true)

---

## Why

> has anyone been struggling with Java recently? I’m having issues to build
> mito on my M1
>
> &mdash; [Adrian](https://strise.slack.com/archives/C05V95CPJNS/p1709107078009879)

---

## Why

> ## 🚀 Setup
>
> 1. Install [Node 20](https://nodejs.org/en/)
> 2. Install the package manager PNPM: `npm i -g pnpm@8.10`
> 3. Install dependencies in all apps and libs: `pnpm install`
>    - This will also run the `postinstall` script, which compiles all
>      translations from `.po` files to `.ts` files.
>
> &mdash; Milkyway repo README

---

## Demo

---

## IDE support

- IntelliJ IDEA

  - [Nix plugin]
  - [direnv plugin]

- VS Code

  - [Nix extension pack]
    ([Open VSX link])

- Vim/Neovim
  - You're already in the terminal.

[Nix plugin]: https://plugins.jetbrains.com/plugin/8607-nixidea
[direnv plugin]: https://plugins.jetbrains.com/plugin/15285-direnv-integration
[Nix extension pack]: https://marketplace.visualstudio.com/items?itemName=pinage404.nix-extension-pack
[Open VSX link]: https://open-vsx.org/extension/pinage404/nix-extension-pack
