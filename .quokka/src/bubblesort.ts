// go through the array and swap adjacent elements if they are in the wrong order
const sort = arr => {
  const [first, sec, ...rest] = arr;
  if (arr.length === 1) {
    console.log(first);
    return [first];
  }
  if (first < sec) {
    return [first, ...sort([sec, ...rest])];
  }
  return [sec, ...sort([first, ...rest])];
};
sort([3, 1, 2, 0, 9]);
/*?*/

const isSorted = (arr = []) =>
  arr.reduce((acc, n, idx) => {
    if (acc === false) return false;
    if (n < arr[idx - 1]) {
      return false;
    }
    return true;
  }, true);

const bubbleSort = arr => {
  if (isSorted(arr)) {
    return arr;
  }
  return bubbleSort(sort(arr));
};

// bubbleSort([4,2,1,4,6,6])/*?*/

const fib = num => {
  if (num <= 1) return 1
  return fib(num - 1) + fib(num - 2)
}
console.log(fib(10))
