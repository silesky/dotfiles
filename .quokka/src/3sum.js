const twoSum = (arr, sum) => {
  const m = {}; // key = compliment, value = number
  for (let el of arr) {
    if (el in m) {
      return [m[el], el];
    }
    const compliment = sum - el;
    m[compliment] = el;
  }
  return;
};
const threeSum = (arr, sum) => {
  const pastValues = [];
  for (let el of arr) {
    const compliment = sum - el;
    const twoSums = twoSum(pastValues, compliment);
    if (twoSums) return [...twoSums, el];
    pastValues.push(el);
  }
};
const arr = [0, 1, 2, 5, 6, 7, 3, 8, 9, 22, 13, 15, 16, 12];

const res = threeSum(arr, 10);
console.log(JSON.stringify(res));
