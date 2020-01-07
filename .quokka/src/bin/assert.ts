// assert
const o = {
  name: 'john'
}

const assert = (expr: unknown): asserts expr => {
  if (!expr) {
    throw Error('assertion error')
  }
}
const getName = (prop: unknown) => {
  assert(typeof prop !== 'string')
  return prop.join('')
}

const f = getName('names')
console.log(f)
