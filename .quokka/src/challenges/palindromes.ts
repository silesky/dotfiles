const reverseStr = (v: string): string => {
  const first = v[0]
  const rest = v.slice(1)
  if (!rest.length) return first;
  return reverseStr(rest) + first
};

const palindromes = (v: string) => {
  return v === reverseStr(v)
}


console.log(palindromes('hello olleh'))
