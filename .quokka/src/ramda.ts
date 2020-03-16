import { lastIndexOf } from 'ramda';

const range = num => [...Array(num)].map((_, idx) => idx + 1);
var spiralOrder = function(matrix: number[][]): number[] {
  if (!matrix.length) return [];
  let lastRowIdx = matrix.length - 1;
  let lastColIdx = matrix[0].length - 1;
  let firstColIdx = 0;
  let firstRowIdx = 0;
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

    lastRowIdx--;
    lastColIdx--;

    // bottom right
    while (true) {
      if (colIdx !== firstColIdx) {
        arr.push(matrix[rowIdx][colIdx]);
        colIdx--;
      } else {
        firstColIdx++;
        break;
      }
    }

    while (true) {
      if (rowIdx !== firstRowIdx) {
        arr.push(matrix[rowIdx][colIdx]);
        rowIdx--;
      } else {
        console.log('finished', rowIdx);
        firstRowIdx++;
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
//
// [1,2,3,6,9,8,7,4,5]

console.log(result);
/*?*/
