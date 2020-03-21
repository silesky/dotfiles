class CustomError extends Error {
  meta = '' // implicit constructor
}

class MyError extends CustomError {
  private meta = '_CUSTOM_ERROR'
  name = 'MyError';
  message = '';
  constructor(message: MyError['message']) {
    super(message)
    this.message = message;
  }
}

const main = () => {
  try {
    const f = new MyError('a message');
    throw f;
  } catch (err) {
    if (err instanceof MyError) {
      console.log(err.message)
      console.log(err.meta)
    }
  }
};
main();
