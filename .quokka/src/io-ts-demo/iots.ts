import * as t from 'io-ts';
import { PathReporter } from 'io-ts/lib/PathReporter';
import {isLeft, isRight } from 'fp-ts/lib/Either'
import * as tPromise from 'io-ts-promise';

const states = {
  AL: 'Alabama',
  AK: 'Alaska',
  AZ: 'Arizona',
  AR: 'Arkansas',
  CA: 'California',
  CO: 'Colorado',
  CT: 'Connecticut',
  DE: 'Delaware',
  DC: 'District Of Columbia',
  FL: 'Florida',
  GA: 'Georgia',
  HI: 'Hawaii',
  ID: 'Idaho',
  IL: 'Illinois',
  IN: 'Indiana',
  IA: 'Iowa',
  KS: 'Kansas',
  KY: 'Kentucky',
  LA: 'Louisiana',
  ME: 'Maine',
  MD: 'Maryland',
  MA: 'Massachusetts',
  MI: 'Michigan',
  MN: 'Minnesota',
  MS: 'Mississippi',
  MO: 'Missouri',
  MT: 'Montana',
  NE: 'Nebraska',
  NV: 'Nevada',
  NH: 'New Hampshire',
  NJ: 'New Jersey',
  NM: 'New Mexico',
  NY: 'New York',
  NC: 'North Carolina',
  ND: 'North Dakota',
  OH: 'Ohio',
  OK: 'Oklahoma',
  OR: 'Oregon',
  PA: 'Pennsylvania',
  RI: 'Rhode Island',
  SC: 'South Carolina',
  SD: 'South Dakota',
  TN: 'Tennessee',
  TX: 'Texas',
  UT: 'Utah',
  VT: 'Vermont',
  VA: 'Virginia',
  WA: 'Washington',
  WV: 'West Virginia',
  WI: 'Wisconsin',
  WY: 'Wyoming',
} as const;

// Product is now a "codec" -- a runtime representation of the static type "Product"
const Product = t.type({
  id: t.string,
  name: t.string,
  category: t.union([t.literal('vapes'), t.literal('bed_bath'), t.literal('food')]),
  location: t.type({
    state: t.keyof(states), // preferred way of creating a union type of literal strings
  }),
});


// no namespace clashing -- typescript is in its own scope.
type Product = t.TypeOf<typeof Product>;

  const maybeProduct = t.array(Product).decode([
    {foo: 123},
    {bar: 456}
  ]);

  if (isRight(maybeProduct)) {
    console.log(maybeProduct.right)
  } else {
    console.log(maybeProduct.left)
  }
// api will fetch the product -- but it changes!
const fetchProduct = () => {
  return Promise.resolve({
    id: '123',
    name: '15mg cbd pen',
    category: 'vapes',
    location: {
      state: 'PR',
    },
  });
};

// this special t.typeOf operator gives us the vanilla
const getProduct = async (): Promise<Product | void> => {
  try {
    const product = await fetchProduct().then(tPromise.decode(Product));
    return product;
  } catch (err) {
    if (tPromise.isDecodeError(err)) {
      console.log(err);
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

// main();
