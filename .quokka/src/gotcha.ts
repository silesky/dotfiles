const foobar = {
  age: 24,
  extraKey: 'this is cool',
};

const createFoobar = (person: { age: number }) => {
  return person;
};
// valid
createFoobar(foobar);

// fail!
createFoobar({ age: 24, extraKey: 'this is weird' });
