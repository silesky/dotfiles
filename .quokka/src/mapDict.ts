import { compose } from 'rambda';

compose(
  (x: string): string => `${x}foo`,
  (x: number): string => `${x}`,
  (x: number): number => x * 2,
);

type MapDict = <Key extends string, V, V2>(
  obj: Record<Key, V>,
  exp: (arg: V) => V2,
) => Record<Key, V2>;

const mapDict: MapDict = (obj, fn) => {
  return Object.assign({}, ...Object.keys(obj).map(k => ({ [k]: fn(obj[k]) })));
};
