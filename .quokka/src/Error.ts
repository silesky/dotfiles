interface ISerializable {
  toJSON: () => Error;
}
class CustomError extends Error {
  protected meta = '__CUSTOM_ERROR'; // implicit constructor
}

class MyError extends CustomError {
  name = 'MyError';
  toJSON = () => {
    return {
      stringified: true,
      name: this.name,
      message: this.message
    }
  }
}

class Employee {
  public name: string
  constructor() {
     this.name = "Leonardo Lima";
  }
}
// same as
class Employee2 {
  name = "Leanardo Lima"
}

const main = () => {
  try {
    const f = new MyError('a message');
    throw f;
  } catch (err) {
    if (err instanceof MyError) {
      console.log(err)
      console.log(JSON.stringify(err)) // toJSON changes what JSON.stringify does so it doesn't output a protected class.
    }
  }
};
main();
