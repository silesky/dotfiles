/* function canTwoMoviesFillFlight(movieLengths = [], flightLength = 100) {
  const arr = [];
  let res = false;
  movieLengths.forEach(eachMovieLength => {
    const compliment = flightLength - eachMovieLength;
    arr.push(compliment);
    if (arr.includes(compliment)) {
      res = true;
    }
  });
  return res;
} */

function canTwoMoviesFillFlight(movieLengths = [], flightLength = 100) {
  const m = {};
  let res = false;
  movieLengths.forEach((eachMovieLength, idx) => {
    const compliment = flightLength - eachMovieLength;
    if (eachMovieLength in m) {
      res = true;
    }
    m[compliment] = null;
  });
  return res;
}

// Tests
function assertEquals(a, b, desc) {
  if (a === b) {
    console.log(`${desc} ... PASS`);
  } else {
    console.log(`${desc} ... FAIL: ${a} != ${b}`);
    throw Error('fail');
  }
}

let desc,
  expected,
  actual = null;

desc = 'long flight';
actual = canTwoMoviesFillFlight([2, 4], 6);
console.log(expected);
expected = true;
assertEquals(actual, expected, desc);

desc = 'one movie half flight length';
actual = canTwoMoviesFillFlight([3, 8], 6);
console.log(actual);
expected = false;
console.log(assertEquals(actual, expected, desc));
/*?*/

desc = 'two movies half flight length';
actual = canTwoMoviesFillFlight([3, 8, 3], 6);
expected = true;
assertEquals(actual, expected, desc);

desc = 'lots of possible pairs';
actual = canTwoMoviesFillFlight([1, 2, 3, 4, 5, 6], 7);
expected = true;
assertEquals(actual, expected, desc);
console.log(expected);

desc = 'not using first movie';
actual = canTwoMoviesFillFlight([4, 3, 2], 5);
console.log(actual);
expected = true;
assertEquals(actual, expected, desc);

desc = 'only one movie';
actual = canTwoMoviesFillFlight([6], 6);
expected = false;
assertEquals(actual, expected, desc);

desc = 'no movies';
actual = canTwoMoviesFillFlight([], 2);
expected = false;
assertEquals(actual, expected, desc);

// e.g. twoSum([1,6,3,5,2], 7) // [0,1]
