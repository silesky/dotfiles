import deepMap from 'deep-map';

type Compute<T> = T extends Function ? T : {} & { [K in keyof T]: T[K] };

export type DeepExclude<T, U> = Compute<
  T extends (...args: any[]) => any
    ? T
    : T extends any[]
    ? _DeepExcludeFromArray<T[number], U>
    : T extends object
    ? _DeepExcludeFromObject<T, U>
    : T
>;

export interface _DeepExcludeFromArray<T, U> extends Array<DeepExclude<Exclude<T, U>, U>> {}

export type _DeepExcludeFromObject<T, U> = {
  [P in keyof T]: DeepExclude<Exclude<T[P], U>, U>;
};

type MyObject = {
  a?: {
    b?: string | undefined | null;
    c?: string | undefined | null;
  };
  d: number;
};

const obj: MyObject = {
  a: {
    b: 'B',
    c: undefined
  },
  d: 5,
};

const result: DeepExclude<MyObject, null> = deepMap(obj, v => (v !== null ? undefined : v));
console.log(result)
