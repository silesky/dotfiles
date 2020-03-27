// given a string, return character that is most common
const maxChar = (v: string) => {
  const arr = v.split('')
  const m = arr.reduce<any>((acc, char) => {
    return {
      ...acc,
      [char]: acc[char] ? acc[char] + 1 : 1
    }
  }, {})
  const sorted = Object.keys(m).sort((char1, char2) => {
    if (m[char1] > m[char2]) return -1
    if (m[char1] === m[char2]) return 0
    return 1
  })
  return sorted[0]
}



console.log(maxChar('abncccsa'))
