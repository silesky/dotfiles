module.exports = {
  extends: 'eslint:recommended',
  globals: {
    fixture: true,
    chrome: true,
  },
  "parserOptions": {
    "ecmaVersion": 8,
    "sourceType": "module",
    "ecmaFeatures": {
      "jsx": true
    }

  },
  "env": {
    "node": true,
    "es6": true,
    "browser": true,
    "jest": true,
    "jquery": true
  },
  rules: {
    'arrow-body-style': 0, // makes debugging easier
    'no-console': 0,
    'no-unused-expressions': 0, // allowing ternary function calls makes calling action methods nicer
    'no-plusplus': ['error', { 'allowForLoopAfterthoughts': true }],
    'import/no-extraneous-dependencies': 0, // shared error
    'import/no-unresolved': 0, // shared error
    'import/extensions': 0, // shared error
    'react/require-default-props': 0, // shared error
    'react/no-danger': 0, // dangerouslySetInnerHTML - there's no need for eslint to warn us about an attribute to with 'dangerous' in the name.
    'comma-dangle': [1, "only-multiline"],
  }
};
