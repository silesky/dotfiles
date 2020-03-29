
const initialState = {
  squares: []
};

const createSquare = ([x, y], { mine = false, flag = false }) => {
  return {
    coords: [x, y],
    flag,
    mine
  };
};
const range = (size) => [...Array(size)].map((_, idx) => idx + 1)
const createGrid = (size) => {
  const squares = range(size).flatMap((a) => {
    return range(size).map((b) => createSquare([a, b]))
  })
  return squares
}
console.log(createGrid(100))

export const reducer = (state = initialState, { type, payload }) => {
  switch (type) {
    case 'INIT': {
      const { size } = payload;
      return { ...state, squares: createGrid(size) };
    }
    default:
      return state;
  }
};
