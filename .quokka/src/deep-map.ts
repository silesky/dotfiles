import {default as deepMap} from 'deep-map';
​
type Compute<T> = T extends Function ? T : {} & { [K in keyof T]: T[K] };
​
export type DeepExclude<T, U> = Compute<
  T extends (...args: any[]) => any
    ? T
    : T extends any[]
    ? DeepExcludeFromArray<T[number], U>
    : T extends object
    ? DeepExcludeFromObject<T, U>
    : T
>;
​
export type DeepExcludeFromArray<T, U> = Array<DeepExclude<Exclude<T, U>, U>>
​
export type DeepExcludeFromObject<T, U> = {
  [P in keyof T]: DeepExclude<Exclude<T[P], U>, U>;
};
​
type MyType = {
  a?: {
    b?: string | undefined | null;
    c?: string | undefined | null;
  },
  d?: string | undefined | null;
};
​
const obj: MyType = {
  a: {
    b: 'hello',
    c: null,
  },
  d: null,
}



const resultWithoutNull: DeepExclude<MyType, null> = deepMap('abc', 'avc')
type f = typeof deepMap
console.log(resultWithoutNull)
