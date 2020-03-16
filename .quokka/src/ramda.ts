import { lastIndexOf } from 'ramda';

const range = num => [...Array(num)].map((_, idx) => idx + 1);
var spiralOrder = function(matrix: number[][]): number[] {
  if (!matrix.length) return [];
  let lastRowIdx = matrix.length - 1;
  let lastColIdx = matrix[0].length - 1;
  const totalLength = matrix.reduce((p, n) => p.concat(n)).length;
  const arr: number[] = [];
  let colIdx = 0;
  let rowIdx = 0;
  while (arr.length < totalLength) {
    while (true) {
      if (colIdx !== lastColIdx) {
        arr.push(matrix[rowIdx][colIdx]);
        colIdx++;
      } else {
        lastColIdx--;
        break;
      }
    }

    while (true) {
      if (rowIdx !== lastRowIdx) {
        arr.push(matrix[rowIdx][colIdx]);
        rowIdx++;
      } else {
        break;
      }
    }

    // bottom right
    while (true) {
      if (colIdx !== 0) {
        arr.push(matrix[rowIdx][colIdx]);
        colIdx--;
      } else {
        break;
      }
    }

    while (true) {
      if (rowIdx !== 0) {
        arr.push(matrix[rowIdx][colIdx]);
        rowIdx--;
      } else {
        console.log('finished', rowIdx);
        rowIdx++;
        colIdx++;
        break;
      }
    }
  }
  return arr.slice(0, totalLength);
};

const result = spiralOrder([
  [1, 2, 3, 4],
  [5, 6, 7, 8],
  [9, 10, 11, 12],
  [13, 14, 15, 16],
]);
console.log(result);
// [1,2,3,4,8,12,16,15,14,13,9,5,6,7,11,10]

const result2 = spiralOrder([
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9],
]);
console.log(result2);
// [1,2,3,6,9,8,7,4,5]

/*?*/
