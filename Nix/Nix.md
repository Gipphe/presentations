---
marp: true
style: |
  section.top-aligned {
    justify-content: flex-start;
  }
---

# Developer environment as code

> "Just the tip" of Nix

---

## What

> Nix is a powerful package manager for Linux and other Unix systems that makes
> package management reliable and reproducible. It provides **atomic upgrades** and
> rollbacks, side-by-side installation of **multiple versions of a package**,
> multi-user package management and easy setup of build environments.
>
> &mdash; Copilot

---

## Similar to\*

- Poetry
  - Virtual envs
  - `poetry shell`
- nvm
  - `.nvmrc`
- asdf
  - `.tool-versions`
- sdkman
  - `.sdkmanrc`

<!-- markdownlint-disable MD036 -->

_\* 10% of it is at least_

<!-- markdownlint-enable MD036 -->

---

## Language agnostic

---

## Largest package repository

80 000+ packages

---

## Nix is many things

- Build system
- Configuration tool
- Package manager
- Developer environment manager
- etc.

![bg right cover](https://github.com/Gipphe/presentations/blob/main/Nix/img/iceberg.webp?raw=true)

---

## Nix is many things

- ~~Build system~~
- ~~Configuration tool~~
- ~~Package manager~~
- Developer environment manager
- ~~etc.~~

![bg right cover](https://github.com/Gipphe/presentations/blob/main/Nix/img/iceberg.webp?raw=true)

---

## Why

---

<!-- _class: top-aligned -->

## Flaky setups

> has anyone been struggling with Java recently? I’m having issues to build
> mito on my M1
>
> &mdash; [Adrian](https://strise.slack.com/archives/C05V95CPJNS/p1709107078009879)

---

<!-- _class: top-aligned -->

## Manual setup steps

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

---

### VS Code

- [Nix extension pack]
  ([Open VSX link])
- [Direnv VSCode plugin]

---

### Vim/Neovim

- You're already in the terminal.
- Regular `direnv` and `nix` will do.

---

### IntelliJ IDEA

- ~~[Nix plugin]~~
  - Syntax highlighting only
- ~~[direnv plugin]~~
  - Can only load env vars
- ~~[Better direnv plugin]~~
  - Doesn't work
- Have to run it from command line
  - `JAVA_HOME`
  - `SCALA_HOME`
  - `idea .`

![bg right contain](https://i.kym-cdn.com/photos/images/newsfeed/001/485/098/245.gif)

---

## Conclusion

- Simplifies dependency and SDK handling
- IntelliJ is weird

[Nix plugin]: https://plugins.jetbrains.com/plugin/8607-nixidea
[direnv plugin]: https://plugins.jetbrains.com/plugin/15285-direnv-integration
[Nix extension pack]: https://marketplace.visualstudio.com/items?itemName=pinage404.nix-extension-pack
[Open VSX link]: https://open-vsx.org/extension/pinage404/nix-extension-pack
[Direnv VSCode plugin]: https://marketplace.visualstudio.com/items?itemName=mkhl.direnv
[Better direnv plugin]: https://plugins.jetbrains.com/plugin/19275-better-direnv
