const mapArr = (arr, fn) => {
  const [first, ...rest] = arr
  if (!rest.length) {
    return [fn(first)]
  }

  return [fn(first), ...mapArr(rest, fn)]
}

/*?*/


const reduceArr = (arr, fn, acc) => {
  const [first, ...rest] = arr

  const newAccum = fn(acc, first)
  if (!rest.length)  {
    console.log(newAccum)
    return newAccum
  }
 const v = reduceArr(rest, fn,  fn(acc, first)) // eventually, this will  get called with "reduceArr([], fn, 19)" ... it will then pass the newAccum
 console.log(v)
 return v;
}






// mapArr([1,2,2,3], (x) => x * 2)
reduceArr([1,2,2,5,6,3], (acc, n) => acc + n, 0)
/*?*/



const reduceArr = (arr, fn, acc) => {
  const [forst]
}






















