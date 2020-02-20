import R from 'ramda';

R.intersection(['foo', 'bar'], ['foo', 'bar', 'baz']);
/*?*/
/*?*/
// @ts-ignore
const f = R.not(x => true)
f()
R.filter(R.not(x => x), [1,2,3])
