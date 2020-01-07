// traditional typeguard
const isString = (input: unknown): input is string => {
  return typeof input === "string";
};

const doSomethingWithTraditionalGuard = (input: string | number) => {
  if (isString(input)) {
    console.log(input);
  }
};

// must be declared with the function keyword
// can throw errors
function assertString(input: unknown): asserts input is string {
  if (typeof input === "string") return;
  throw new Error("Input must be a string!");
}

const doSomething = (input: unknown) => {
  assertString(input);
  console.log(input);
};

// better
