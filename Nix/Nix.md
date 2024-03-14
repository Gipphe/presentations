---
marp: true
style: |
  section.top-aligned {
    justify-content: flex-start;
  }
---

# Development environment as code

---

## Problem

---

### Flaky setups

> has anyone been struggling with Java recently? I’m having issues to build
> mito on my M1
>
> &mdash; [Adrian](https://strise.slack.com/archives/C05V95CPJNS/p1709107078009879)

---

### Manual setup steps

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

## Onboarding

- New hire
- Wants to work on `mito`
- Has to set up environment
- Finds the doc

---

![bg contain](https://github.com/Gipphe/presentations/blob/main/Nix/img/manual_1.png?raw=true)

---

![bg contain](https://github.com/Gipphe/presentations/blob/main/Nix/img/manual_2.png?raw=true)

---

![bg contain](https://github.com/Gipphe/presentations/blob/main/Nix/img/manual_3.png?raw=true)

---

![bg contain](https://github.com/Gipphe/presentations/blob/main/Nix/img/manual_4.png?raw=true)

---

![bg contain](https://github.com/Gipphe/presentations/blob/main/Nix/img/manual_5.png?raw=true)

---

![bg contain](https://github.com/Gipphe/presentations/blob/main/Nix/img/manual_6.png?raw=true)

---

![bg contain](https://github.com/Gipphe/presentations/blob/main/Nix/img/manual_7.png?raw=true)

---

## That was a lot...

---

## Nix

> A package manager

---

### What

> Nix is a powerful package manager for Linux and other Unix systems that makes
> package management reliable and reproducible. It provides **atomic upgrades**
> and rollbacks, side-by-side installation of **multiple versions of a
> package**, multi-user package management and easy setup of build
> environments.
>
> &mdash; Copilot

---

### What

> Nix tool. Make software handle easy. No break old, when new come. Fix, build,
> share, all in cave-safe way.
>
> &mdash; ChatGPT, when prompted with "Describe Nix in 4 short sentences like a
> caveman."

---

### Similar to\*

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

### Language agnostic

---

### Largest package repository

80 000+ packages

![bg contain right](https://repology.org/graph/map_repo_size_fresh.svg)

---

## Nix is many things

- Build system
- Configuration tool
- Package manager
- Dev env manager
- etc.

![bg right cover](https://github.com/Gipphe/presentations/blob/main/Nix/img/iceberg.webp?raw=true)

---

## Nix is many things

- ~~Build system~~
- ~~Configuration tool~~
- ~~Package manager~~
- Dev env manager
- ~~etc.~~

![bg right cover](https://github.com/Gipphe/presentations/blob/main/Nix/img/iceberg.webp?raw=true)

---

## Demo

---

## IDE support

---

### Visual Studio Code

- [Nix extension pack]
- [Direnv VSCode plugin]

---

### Vim/Neovim

- You're already in the terminal.
- Regular `direnv` and `nix` will do.
- `vim .` or `nvim .`

---

### IntelliJ IDEA

- ~~[Nix plugin]~~
  - Syntax highlighting only
- ~~[direnv plugin]~~
  - Can only load env vars
- ~~[Better direnv plugin]~~
  - Doesn't work

![bg right contain](https://i.kym-cdn.com/photos/images/newsfeed/001/485/098/245.gif)

---

### IntelliJ IDEA

- Have to run it from command line
  - `JAVA_HOME`
  - `SCALA_HOME`
  - `idea .`
    - Only required when setting new version
    - Automatic detection
  - Update to Scala or Java a bit manual
    - Remove existing SDK
    - Update
    - Restart IDEA
    - IDEA finds new Java/Scala based on `JAVA_HOME`/`SCALA_HOME`

---

## Conclusion

- Simplifies dependency and SDK handling
- Ensures consistency between developers
- Opt-in
  - Without `direnv` and `nix`, `flake.nix` does nothing
- ~~IDEA is weird~~

[Nix plugin]: https://plugins.jetbrains.com/plugin/8607-nixidea
[direnv plugin]: https://plugins.jetbrains.com/plugin/15285-direnv-integration
[Nix extension pack]: https://marketplace.visualstudio.com/items?itemName=pinage404.nix-extension-pack
[Direnv VSCode plugin]: https://marketplace.visualstudio.com/items?itemName=mkhl.direnv
[Better direnv plugin]: https://plugins.jetbrains.com/plugin/19275-better-direnv
