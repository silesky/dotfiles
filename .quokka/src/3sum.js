const threeSum = (arr, num) => {
  const m = {};
  for (el of arr) {

    const compliment = num - el
    if (compliment in m) {
      return [m[compliment], el]
    }
    m[compliment] = el
  }
};
const arr = [1, 2, 5, 6, 7, 8, 9, 22, 13, 15, 16, 12];

const res = threeSum(arr, 10);
console.log(JSON.stringify(res))
