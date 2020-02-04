import * as t from 'io-ts';
import { PathReporter } from 'io-ts/lib/PathReporter';
const { report } = PathReporter;

const fetchProduct = (): Promise<Product> => {
  return Promise.reject('Error');
};

// Product is now a "codec" -- a runtime representation of the static type "Product"
const Product = t.type({
  id: t.number,
  name: t.string,
  category: t.array(t.string),
});

type Product = typeof Product;

// left (fail) -> right (success)
const result = Product.decode({ id: 123 });
console.log(result);
