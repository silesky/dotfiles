const fizzBuzz = () => {
  const [divBy3, divBy5] = [3, 5].map(n => {
    return (arg: number) => arg % n === 0;
  });
  return [...Array(100).keys()].map(function*(_, idx) {
    const num = idx + 1;
    const fizz = divBy3(num);
    const buzz = divBy5(num);
    if (fizz) yield 'fizz';
    if (buzz) yield 'buzz';
    if (!fizz && !buzz) yield num;
  });
};

const res = fizzBuzz().map(gen => [...gen].join(''));
