const arr = [1, 2, 'hello'];

// go
type ToUnion<T extends readonly any[] | any[]> = T extends Promise<any>
  ? Promise<T[number] | MyError<any>>
  : T[number] | MyError<any>;
type A = Promise<string | number>;
type B = Promise<string> | Promise<number>;
type C = B extends A ? B : never;

const allSettled = <T>(promises: Promise<T>[]): Promise<T | Error> => {
  return Promise.all(promises.map(p => p.catch(el => new Error(el))));
};

const getFoo = () => Promise.resolve(123 as const);
const getFooAgain = () => Promise.resolve('hello');
const getFooError = (shouldThrow = true) => {
  if (shouldThrow) {
    return Promise.reject(new Error('123'));
  }
  return Promise.resolve(123);
};
const main = async () => {
  const promises = [getFoo(), getFooError(), getFooAgain()];
  type F = ToUnion<typeof promises>;
  const res = await allSettled(promises);
  console.log(res[1].message);
};

main();
