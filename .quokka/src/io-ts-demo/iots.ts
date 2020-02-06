import * as t from 'io-ts';
import { PathReporter } from 'io-ts/lib/PathReporter';
import { isRight, map, either } from 'fp-ts/lib/Either';
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
  date: new t.Type<Date, string, unknown>(
    'DateFromString',
    (u): u is Date => u instanceof Date,
    (maybeStr, c) =>
      either.chain(t.string.validate(maybeStr, c), maybeDateStr => {
        const d = new Date(maybeDateStr)
        return isNaN(d.getTime()) ? t.failure(maybeStr, c) : t.success(d)
      }),
     // encode (convert from type back into base)
    date => date.toISOString()
  ),
});

type Product = t.TypeOf<typeof Product>;

const decodedProduct = Product.decode([{ foo: 123 }, { bar: 456 }])

if (isRight(decodedProduct)) {
  console.log(decodedProduct.right);
} else {
  console.log(decodedProduct.left);
}


/******************** */
/***** PROMISES ******/
/*********************/

const fetchProduct = () => {
  return Promise.resolve({
    id: '123',
    name: '15mg cbd pen',
    category: 'vapes',
    location: {
      state: 'IL',
    },
    date: '2020-02-05T19:29:36.883Z'
  });
};

const getProduct = async (): Promise<Product | void> => {
  try {
    const product = await fetchProduct().then(tPromise.decode(Product));
    return product;
  } catch (err) {
    if (tPromise.isDecodeError(err)) {
      console.log(err);
      console.log('validation errr');
    } else {
      console.log('error due to network issue');
    }
  }
};


const main = async() => {
  const p = await getProduct();
  if (p) {
    console.log(p.date.getFullYear())
  }
}
main()
