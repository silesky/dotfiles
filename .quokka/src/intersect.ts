const intersect = (arr: unknown[], arr2: unknown[]) => {
  return arr.some(el => arr2.includes(el));
};
