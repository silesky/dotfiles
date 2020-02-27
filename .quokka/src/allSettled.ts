import { o } from 'ramda';

type ExtractTuple<T> = T extends [infer a, ...T[]] ? a : never;
export type Head<L extends readonly any[]> = L extends [infer I, ...any[]] ? I : never;
const r = [1, 2, 3] as const;

type B = Head<typeof r>;

type F = ExtractTuple<typeof r>;
const allSettled = <T, U extends Promise<T>[]>(promises: U): Promise<T[]> => {
  const mapped = promises.map(p => p.catch(el => el));
  return Promise.all(mapped);
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
  const res = await allSettled(promises);
  console.log(res[1].message);
};

main();
