var twoSum = function(nums, target) {
  let o = {}; // type is {[compliment: number]: Index }
  let idx = 0;
  for (let eachNum of nums) {
    const compliment = target - eachNum;
    if (eachNum in o) {
      const complimentIndex = o[eachNum];
      return [complimentIndex, idx]; // if the compliment is found, we can retun
    }
    o[compliment] = idx;
    idx++;
  }
};

// e.g. twoSum([1,6,3,5,2], 7) // [0,1]
