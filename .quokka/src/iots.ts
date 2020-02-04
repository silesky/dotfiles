import * as t from 'io-ts';
import { PathReporter } from 'io-ts/lib/PathReporter';
import * as tPromise from 'io-ts-promise';

const fetchProduct = () => {
  return Promise.resolve({
    id: '123',
    name: '15mg cbd pen',
    category: ['vapes'],
    location: {}, // error
  });
};

// Product is now a "codec" -- a runtime representation of the static type "Product"
const Product = t.type({
  id: t.string,
  name: t.string,
  category: t.array(t.string),
  location: t.type({
    warehouses: t.array(t.string),
  }),
});

// this special t.typeOf operator gives us the vanilla
type Product = t.TypeOf<typeof Product>;

const getProduct = async (): Promise<Product | void> => {
  try {
    const product = await fetchProduct().then(tPromise.decode(Product));
    return product;
  } catch (err) {
    if (tPromise.isDecodeError(err)) {
      console.log('error due to decoding issue');
    } else {
      console.log('error due to network issue');
    }
    return;
  }
};

const main = () => {
  getProduct();
};

main();
