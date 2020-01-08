module.exports = {
  env: {
    browser: true,
    commonjs: true,
    es6: true,
    node: true,
  },
  extends: [
    "eslint:recommended",
    "plugin:@typescript-eslint/eslint-recommended"
  ],
  parser: "@typescript-eslint/parser",
  parserOptions: {
    ecmaVersion: 2018,
    sourceType: 'module'
  },
  plugins: ["@typescript-eslint"],
  rules: {
    "no-unused-vars": 0,
    "quotes": ["error", "single", { "avoidEscape": true }]
  }
};
