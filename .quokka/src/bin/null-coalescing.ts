// null coalescing

type User = {
  address?: {
    lineOne: string;
    lineTwo?: string;
  };
};

const user: User = {};
const res = user?.address?.lineTwo;

console.log(res);
