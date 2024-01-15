---
marp: true
---

# Building against stupid build targets

> Auth0 edition

---

## Module systems

---

## Why have just 1?

---

## When you can have 2

- Javascript modules
- CommonJS

---

## When you can have ~2~ 3!

- Javascript modules
- CommonJS
- AMD

---

## When you can have ~2~ ~3~ 4!!

- Javascript modules
- CommonJS
- AMD
- SystemJS

---

## When you can have ~2~ ~3~ ~4~ _5_!!!

- Javascript modules
- CommonJS
- AMD
- SystemJS
- UMD

---

![](./img/five-of-them.jpg)

---
## Javascript modules (screw the rest)

---


```javascript
// add.js
export function add(x, y) {
  return x + y
}

// main.js
import {add} from './add'

console.log(add(1, 2))
//=> 3
```

---

## Test

```javascript
// add.test.js
import {add} from './add'

describe('add', () => {
  it('should add two and two together', () => {
    expect(add(2, 2)).toBe(4)
  })
})
```

---

## Third-party code

```javascript
// time.js
import moment from 'moment'

export function yesterdayAsString() {
  return moment().sub(1, 'days').calendar()
}
```

---

## Mocking

```javascript
import moment from 'moment'
import {yesterdayAsString} from './time'

jest.mock('moment')

describe('yesterdayAsString', () => {
  it('should subtract one day', () => {
    const sub = jest.fn()
    moment.mockImplementationOnce(() => ( { sub } ))
    sub.mockImplementationOnce(() => ({calendar: () => 'foo'}))

    expect(yesterdayAsString()).toBe('foo')
    expect(moment).toBeCalledTimes(1)
    expect(sub).toBeCalledWith(1, 'days')
  })
})
```

---

```
Users: Code should be modular.
Auth0: yes
Users: Code should be composable.
Auth0: indeed
Users: Modules allows us to do this.
Auth0: what are modules?
```

---

```javascript
// unexported ("unused") function
function rule(user, context, callback) {
  // config available as global object
  if (configuration.some_property === 'true') {
    // api available as global object
    auth0.setUserMetadata(user.user_id, {some_meta: 'data'})
  }
  // NodeJS called. They want their callbacks back.
  callback(null)
}
```

---

```
Users: How do you test this?
Auth0: you can test it with the "try me" button on your rule/action
Users: So, a manual test?
Auth0: yes, a test
```

---

```
Users: How do you UNIT test this?
Auth0: what are unit tests?
```

---

## Running the function in a test

- `eval`
  - But "`eval` is evil"
- Glue an `export ` in front, write to a new file, import the new file in your test

---

```
Users: But third-party code is available as modules, right?
Auth0: ah, by "modules" you mean "require"
Users: No, I mean it a little more general than that-
Auth0: you can only use some modules
Users: Wait, wha-
```

---

## Third-party code

[Can I ~use~ require](https://auth0-extensions.github.io/canirequire/).

```javascript
const moment = require('moment@2.29.4')
//                            ^ this is not a valid use of `require`
```

---

```
Users: But what about mocking?
Auth0: we do not mock our users
Users: No, I mean: what about mocking dependencies? Yes, you can mock third-party modules with your system, but what about the `configuration` and `auth` objects?
Auth0: what is mocking?
```

---
## Mocking global stuff

- Set globally available objects with the same name.
  - Easy
  - Tests can never be ran in parallel
  - Remember to reset your globals :P
- Close over variables in the `eval` scope.

```javascript
import * as fs from 'fs'

function prepareFunction(configuration, auth0) {
  const iHateThis = `
    const rule = ${fs.readFileSync('./rule', 'utf8')}
  `
  eval(iHateThis)
  return rule
}


describe('rule', () => {
  it('test me', () => {
    const setUserMetadata = jest.fn()
    const rule = prepareFunction({some_prop: 'data'}, {setUserMetadata})
    return new Promise(resolve => {
      rule(testUser, testContext, resolve)
    }).then(() => {
      expect(setUserMetadata).toHaveBeenCalledTimes(1)
    })
  })
})
```

---

## We can fix this

---

## Pass in config and Auth0

```javascript
// env: { configuration, auth0 }
function rule(env, user, context, callback) {
  if (env.configuration.some_prop === 'data') {
    env.auth0.setUserMetadata(user.user_id, {prop: 'data'})
  }
  // ...
}
```

---

## Use a bundler

---

![](https://codekitapp.com/images/help/free-rollup-icon@2x.png)

---

```javascript
// add.js
export function add(x, y) {
  return x + y
}

// main.js
import {add} from './add'

console.log(add(1, 2))
//=> 3
```

Turns into

---


```javascript
// main.js
export function add(x, y) {
  return x + y
}

console.log(add(1, 2))
//=> 3
```

---

## Yay, we have modules that can be inlined!

---

### Regular require statements

```javascript
const moment = require('moment@2.29.4')
```

into

```javascript
const moment = require('moment')
```

---

### @rollup/plugin-alias

```javascript
// rollup.config.js
import alias from '@rollup/plugin-alias'

export default {
  // ...
  plugins: [
    alias({
      entries: [
        { find: 'moment', replacement: 'moment@2.29.4' }
      ]
    })
  ]
}
```

---

## Freebies

- Javascript modules
- Tree shaking

---

## Still not good enough

---

```javascript
function rule()
```
