const f = {
  name: false,
  fooName: false,
  hello: false,
  brrr: {
    fooName: false,
    name: false,
    zzz: true,
  },
};
const replaceInObj = (f, someKey, newValue) => {
  const strData = JSON.stringify(f);
  const data = JSON.parse(strData, (key, value) => {
    return `${key}`.toLowerCase().includes(someKey.toLowerCase()) ? newValue : value;
  });
  return data;
};

console.log(replaceInObj(f, 'name', 'sup'));
/*?*/
