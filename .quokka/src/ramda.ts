const range = num => [...Array(num)].map((_, idx) => idx + 1);
var spiralOrder = function(matrix: number[][]): number[] {
  const lastRowIdx = matrix.length - 1;
  const lastColIdx = matrix[0].length - 1;
  const totalLength = matrix.reduce((p, n) => p.concat(n)).length;
  const arr: number[] = [];
  let colIdx = 0;
  let rowIdx = 0;
  while (arr.length < totalLength) {
    while (true) {
      arr.push(matrix[rowIdx][colIdx]);
      if (colIdx === lastColIdx) {
        break;
      } else {
        colIdx++;
      }
    }

    while (true) {
      console.log(rowIdx);
      arr.push(matrix[rowIdx][colIdx]);
      if (rowIdx !== lastRowIdx) {
        rowIdx++;
      } else {
        break;
      }
    }

    while (true) {
      console.log(rowIdx);
      arr.push(matrix[rowIdx][colIdx]);
      if (rowIdx !== lastRowIdx) {
        rowIdx++;
      } else {
        break;
      }
    }

    while (true) {
      arr.push(matrix[rowIdx][colIdx]);
      if (colIdx !== colIdx) {
        colIdx--;
        console.log(colIdx);
      } else {
        break;
      }
    }
  }
  return arr;
};

const result = spiralOrder([
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9],
]);
// [1,2,3,6,9,8,7,4,1,2,5]

console.log(result);
/*?*/
