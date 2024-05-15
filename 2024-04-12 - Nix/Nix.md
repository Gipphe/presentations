---
marp: true
style: |
  section.top-aligned {
    justify-content: flex-start;
  }
---

# Devtools as code

---

## Friction

---

### Flaky setups

> has anyone been struggling with Java recently? I’m having issues to build
> mito on my M1
>
> &mdash; [Adrian](https://strise.slack.com/archives/C05V95CPJNS/p1709107078009879)

---

### "Works on my machine"

- Version mismatches
- Missing libraries
- Missing tooling
- Misconfigured tooling

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

### Onboarding

As a new hire, I:

- Want to work on `mito`
- Have to set up my dev environment
- Find the doc in Notion

---

![bg contain](https://github.com/Gipphe/presentations/blob/c3a03cb55d4b8ce2a65e699e9e67d79a09a68c75/2024-04-12%20-%20Nix/img/manual_1.png?raw=true)

---

![bg contain](https://github.com/Gipphe/presentations/blob/c3a03cb55d4b8ce2a65e699e9e67d79a09a68c75/2024-04-12%20-%20Nix/img/manual_2.png?raw=true)

---

![bg contain](https://github.com/Gipphe/presentations/blob/c3a03cb55d4b8ce2a65e699e9e67d79a09a68c75/2024-04-12%20-%20Nix/img/manual_3.png?raw=true)

---

![bg contain](https://github.com/Gipphe/presentations/blob/c3a03cb55d4b8ce2a65e699e9e67d79a09a68c75/2024-04-12%20-%20Nix/img/manual_4.png?raw=true)

---

![bg contain](https://github.com/Gipphe/presentations/blob/c3a03cb55d4b8ce2a65e699e9e67d79a09a68c75/2024-04-12%20-%20Nix/img/manual_5.png?raw=true)

---

![bg contain](https://github.com/Gipphe/presentations/blob/c3a03cb55d4b8ce2a65e699e9e67d79a09a68c75/2024-04-12%20-%20Nix/img/manual_6.png?raw=true)

---

![bg contain](https://github.com/Gipphe/presentations/blob/c3a03cb55d4b8ce2a65e699e9e67d79a09a68c75/2024-04-12%20-%20Nix/img/manual_7.png?raw=true)

---

### That was a lot...

---

<!-- _class: top-aligned -->

## What we want

- No manual setup
- Automatically pulls necessary tools
- Per repo
- Works on every machine
- **Reproducibility**

---

## Option 1: Docker

---

### Sub-par developer experience

---

### Your IDE will not like you

---

### Communication with outside of the container is hard

---

<!-- _class: top-aligned -->

## What we want

- No manual setup
- Automatically pulls necessary tools
- Per repo
- Works on every machine
- **Reproducibility**

---

<!-- _class: top-aligned -->

## What we want

- No manual setup
- Automatically pulls necessary tools
- Per repo
- Works on every machine
- **Reproducibility**
- Does not require containerization

---

## Option 2: Nix

![bg contain right](https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/Nix_snowflake.svg/2364px-Nix_snowflake.svg.png)

---

### What

> Nix tool. Make software handle easy. No break old, when new come. Fix, build,
> share, all in cave-safe way.
>
> &mdash; ChatGPT, when prompted with "Describe Nix in 4 short sentences like a
> caveman."

---

![bg contain](https://i.redd.it/cg6rhnnw9b581.png)

---

![bg contain](https://github.com/Gipphe/presentations/blob/c3a03cb55d4b8ce2a65e699e9e67d79a09a68c75/2024-04-12%20-%20Nix/img/trinity_focus.png?raw=true)

---

### Language agnostic

---

### Works on ~~any~~ most machines

Not Windows... But it works in WSL 👍

---

### nixpkgs

- Largest repository
- 80 000+ packages
- Good resources for adding new packages

![bg contain right](https://repology.org/graph/map_repo_size_fresh.svg)

---

## Nix can do many things

- Build system
- Configuration tool
- Package manager
- Dev env manager
- etc.

<!-- ![bg right cover](https://github.com/Gipphe/presentations/blob/c3a03cb55d4b8ce2a65e699e9e67d79a09a68c75/2024-04-12%20-%20Nix/img/iceberg.webp?raw=true) -->

---

## Nix can do many things

- ~~Build system~~
- ~~Configuration tool~~
- ~~Package manager~~
- Dev env manager
- ~~etc.~~

![bg right cover](https://github.com/Gipphe/presentations/blob/c3a03cb55d4b8ce2a65e699e9e67d79a09a68c75/2024-04-12%20-%20Nix/img/iceberg.webp?raw=true)

---

### Similar to

- Poetry
  - Virtual envs
  - `poetry shell`
- nvm
  - `.nvmrc`
- asdf
  - `.tool-versions`
- sdkman
  - `.sdkmanrc`

---

## Demo

![bg right contain](https://i.pinimg.com/originals/c9/fb/e2/c9fbe25974eb890e3b4fc88387dd0a07.gif)

- `terrahoff`
- `milkyway`
- `mito`
- `prefect-strise`

---

## IDE support

---

### Visual Studio Code

- [Nix extension pack]
- [Direnv VSCode plugin]

---

### Vim, Neovim, Helix, Kakoune

- You're already in the terminal.
- Regular `direnv` and `nix` will do.
- `vim .` or `nvim .` or `hx .` or `kak .`

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

## Configure IDE through Nix

```nix
outputs = {...}: {
  devShells = {
    idea = pkgs.mkShell {
      packages = [pkgs.jetbrains.idea-ultimate];
    };
    vscode = pkgs.mkShell {
      packages = [pkgs.vscode-fhs pkgs.vscode-extensions.mkhl.direnv];
    };
  };
}
```

```sh
nix develop .#vscode
# or
nix develop .#idea
```

---

## Conclusion

- Simplifies dependency and SDK handling
- Ensures consistency between developers
- Opt-in
  - Without `direnv` and `nix`, `flake.nix` does nothing
- ~~IntelliJ IDEA is weird~~

[Nix plugin]: https://plugins.jetbrains.com/plugin/8607-nixidea
[direnv plugin]: https://plugins.jetbrains.com/plugin/15285-direnv-integration
[Nix extension pack]: https://marketplace.visualstudio.com/items?itemName=pinage404.nix-extension-pack
[Direnv VSCode plugin]: https://marketplace.visualstudio.com/items?itemName=mkhl.direnv
[Better direnv plugin]: https://plugins.jetbrains.com/plugin/19275-better-direnv
