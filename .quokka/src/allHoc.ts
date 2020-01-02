const mapArr = (arr, fn) => {
  const [first, ...rest] = arr
  if (!rest.length) {
    return [fn(first)]
  }

  return [fn(first), ...mapArr(rest, fn)]
}

/*?*/


const reduce = (arr, fn) => {
  const [first, ...rest] = arr

}






mapArr([1,2,2,3], (x) => x * 2)
reduce([1,2,2,3], (acc, n) => acc + n, 0)

























