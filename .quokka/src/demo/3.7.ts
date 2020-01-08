/***************************************************************** */
// optional chaning
type User = {
  address?: {
    lineOne: string;
    lineTwo?: string;
  };
};

const user: User = {};
const res = user?.address?.lineTwo;

console.log(res);

/***************************************************************** */
// null coalescing


let firstResult: string | null | undefined = null
const bar = firstResult ?? 'hello' // will be 'hello'



let firstResult1: boolean | null | undefined = false
const bar1 = firstResult1 ?? 'hello'
console.log(bar1) // false

/***************************************************************** */
// traditional typeguard
const isString = (input: unknown): input is string => {
  return typeof input === 'string';
};

const doSomethingWithTraditionalGuard = (input: string | number) => {
  if (isString(input)) {
    console.log(input);
  }
};

// must be declared with the function keyword
// can throw errors
function assertString(input: unknown): asserts input is string {
  if (typeof input === 'string') return;
  throw new Error('Input must be a string!');
}

const doSomething = (input: unknown) => {
  assertString(input);
  console.log(input);
};

// more stuff
function assertUndefined<T>(v: T): asserts v is NonNullable<T> {
  if (v === undefined || v === null) {
    throw new Error('undefined!')
  }
}

// better
let o: string | number | undefined
assertUndefined(o)
console.log(o)

