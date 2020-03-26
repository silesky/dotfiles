import { Dictionary } from 'lodash';

type GetUnion<T extends any[]> = T[number];
const assign = <U, T extends {[key: string]: any}>(x: U, ...xs: T[]) => {
  xs.forEach(eachX => {
    for (let eachKey of eachX) {

    }
  })
};


