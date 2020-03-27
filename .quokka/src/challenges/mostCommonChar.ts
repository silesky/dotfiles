// given a string, return character that is most common
const maxChar = (v: string): string => {
  const arr = v.split('')
  const m = arr.reduce<{[key: string]: number}>((acc, char) => {
    return {
      ...acc,
      [char]: acc[char] ? acc[char] + 1 : 1
    }
  }, {})
  const sorted = (Object.keys(m) as string[]).sort((char1, char2) => {
    if (m[char1] > m[char2]) return -1
    if (m[char1] === m[char2]) return 0
    return 1
  })
  return sorted[0]
}



console.log(maxChar('bncccddddddddedeeeeeeeeeses'))
