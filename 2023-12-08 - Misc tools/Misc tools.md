---
marp: true
---

# Github CLI, Hurl & Jujutsu

> Misc tools I find nifty

---

## Github CLI

> Goodbye, context switching. Hello, terminal.

![](https://github.com/Gipphe/presentations/blob/main/2023-12-08%20-%20Misc%20tools/img/ghcli.png?raw=true)

### Pros

- Never have to leave the terminal ever again
- Automatable Github processes

### Cons

- So-so support for PR and issue templates

---

## ![height:100px](https://hurl.dev/assets/img/logo-light.svg)

![height:400px](https://github.com/Gipphe/presentations/blob/main/2023-12-08%20-%20Misc%20tools/img/hurl.png?raw=true)

---

### Pros

- Simple
- Chain requests
- Supports most content types you need
- Reads like a HTTP request
- Secrets as variable files
- Easy to commit in VCS
- Good support for syntax in IntelliJ, VSCode and Neovim
- FOSS

---

### Cons

- Poor external tooling
  - Example: Cannot convert an OpenAPI spec
- Sometimes poor error messages
- Basically just a fancier bash script with `curl` built in

---

## Jujutsu

![height:500px](https://github.com/martinvonz/jj/blob/main/demos/git_compat.png?raw=true)

---

### Pros

- Very simple to use
- Change-based instead of branch-based workflow
- Operation log
- Conflicts are included in the history
- _Very_ good rebasing
- Supports git repos
  - "Colocation" makes everything behave
- FOSS

---

### Cons

- Still early days
- Does not support commit signing
- Inconsistencies between `brew` version and repo version
- Basically _no_ support in shell themes

---

## Demoing

- `hurl --variables-file=Misc\ tools/.env Misc\ tools/demo.hurl | jq`
- `jj commit`
- `gh pr create`

![bg right contain](https://i.redd.it/zqfraqc5ww431.png)

---

## Further reading

- [Github CLI](https://cli.github.com)
- [Hurl](https://hurl.dev)
- [Jujutsu](https://github.com/martinvonz/jj)
