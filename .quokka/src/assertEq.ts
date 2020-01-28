function assertEq(a, b, desc = '') {
  if (a === b) {
    console.log(`${desc} ... PASS`);
  } else {
    throw Error(`${desc} ... FAIL: ${a} != ${b}`);
  }
}
export default assertEq;
