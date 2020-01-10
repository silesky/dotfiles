const mapDict = <Key extends string, V, V2>(
  obj: Record<Key, V>,
  fn: (arg: V) => V2
): Record<Key, V2> => {
  return Object.assign(
    {},
    ...Object.keys(obj).map(k => ({
      [k]: fn(obj[k])
    }))
  );
};
