// 'first' acts as the accumulator.
const sum = ([first, sec, ...rest]: any[]) => {
  if (!rest.length) return first + sec;
  return sum([first + sec, ...rest]);
}

