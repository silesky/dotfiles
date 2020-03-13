import lodash from 'lodash';
import { object } from 'io-ts';
const object1 = {
  name: '123',
};

const object2 = {
  name: '123',
  foo: undefined
};


const foo = ({v}) => {
  return v === undefined
}
foo({v: undefined})
/*?*/

