const mapArr = (arr, fn) => {
  const [first, ...rest] = arr
  if (!rest.length) {
    return [fn(first)]
  }

  return [fn(first), ...mapArr(rest, fn)]
}

const reduceArr = (arr, fn, acc) => {
  const [first, ...rest] = arr

 if (!rest.length) return fn(acc, first)
 return reduceArr(rest, fn,  fn(acc, first)) // eventually, this will  get called with "reduceArr([], fn, 19)" ... it will then pass the newAccum
}






reduceArr([1,2,2,5,6,3], (acc, n) => acc + n, 0)























