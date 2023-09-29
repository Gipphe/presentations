---
marp: true
style: |
  section.centered {
    text-align: center;
    text-shadow: #000 0 0 20px;
    color: #fff;
    font-size: 400%;
  }
---

# PEP refactoring

> Hiding implementations behind abstractions

---

## Current situation

![bg opacity:0.6](./spaghetti.jpg)

---

## Core PEP class

- `RoaringPepPerson`
- Taken directly from Roaring Nordic PEP API
- Many unused properties
- Other PEPs have to be a `RoaringPepPerson`
- Tightly coupled with Roaring Nordic PEP API

---

## Global PEPs

- Roaring Global PEP API
  - Not the same fields
  - Different meaning for similar fields
- Convert to `RoaringPepPerson`
  - Lossy conversion

---

## Adding new providers

- Have to convert to `RoaringPepPerson`.
- Cached as `RoaringPepSearchResponse`.
- Search parameters passed as `RoaringPepSearchOptions`.

---

<!-- _class: centered -->

## There is a way

![bg opacity:0.6](./lasagna.jpg)

---

## Layers of abstraction
