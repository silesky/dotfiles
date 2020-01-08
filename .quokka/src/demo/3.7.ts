/***************************************************************** */
{
  // optional-chaining https://github.com/tc39/proposal-optional-chaining
  type User = {
    address?: {
      lineOne: string
    }
  }
  const user: User = {
    address: {
      lineOne: 'foo'
    }
  }
  if (user.address !== undefined) {
    console.log(user.address.lineOne);
  }
}
/***************************************************************** */
{
  // null(ish) coalescing - https://github.com/tc39/proposal-nullish-coalescing
  let firstResult: string | null | undefined;
  const bar = firstResult ?? 'foo'
  console.log(bar); // string

  let firstResult1: boolean | null | undefined = false;
  const bar1 = firstResult1 ?? true;
  console.log(bar1); // boolean
}
/***************************************************************** */
{
  // traditional typeguard


  const isString = (f: unknown): f is string => typeof f === 'string'

  let x: unknown


  // must be declared with the function keyword
  // can throw errors
const assertString = (input: unknown): asserts input is string => {
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
      throw new Error('undefined!');
    }
  }
  // better
  let o: string | number | undefined;
  assertUndefined(o);
  console.log(o);
}
