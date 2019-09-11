type MapDict = <Key extends string, V, V2>(
  obj: Record<Key, V>,
  exp: (arg: V) => V2,
) => Record<Key, V2>;

const mapDict: MapDict = (obj, fn) => {
  return Object.assign({}, ...Object.keys(obj).map(k => ({ [k]: fn(obj[k]) })));
};

// const f = mapDict({ name: 123, 1: '123' }, x => x.split(''));
// console.log(f);

type LinkedList<T = any> = {
  val: T;
  next?: LinkedList<T>;
};
const v = {
  val: 'fo,
};
const o: LinkedList<string> = {
  val: 'foo',
  next: v,
};
