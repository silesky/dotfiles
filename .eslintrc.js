Content-Type: text/enriched
Text-Width: 80

module.exports = <x-color><param>#4f97d7</param>{</x-color>
  extends: 'eslint:recommended',
  globals: <x-color><param>#bc6ec5</param>{</x-color>
    fixture: true,
    chrome: true,
  <x-color><param>#bc6ec5</param>}</x-color>,
  "parserOptions": <x-color><param>#bc6ec5</param>{</x-color>
    "hello": 1,
    "ecmaVersion": 8,
    "sourceType": "module",
    "ecmaFeatures": <x-color><param>#2d9574</param>{</x-color>
      "jsx": true
    <x-color><param>#2d9574</param>}</x-color>

  <x-color><param>#bc6ec5</param>}</x-color>,
  "env": <x-color><param>#bc6ec5</param>{</x-color>
    "node": true,
    "es6": true,
    "browser": true,
    "jest": true,
    "jquery": true
  <x-color><param>#bc6ec5</param>}</x-color>,
  rules: <x-color><param>#bc6ec5</param>{</x-color>
    'arrow-body-style': 0, // makes debugging easier
    'no-console': 0,
    'no-unused-expressions': 0, // allowing ternary function calls makes calling action methods nicer
    'no-plusplus': <x-color><param>#2d9574</param>[</x-color>'error', <x-color><param>#67b11d</param>{</x-color> 'allowForLoopAfterthoughts': true <x-color><param>#67b11d</param>}</x-color><x-color><param>#2d9574</param>]</x-color>,
    'import/no-extraneous-dependencies': 0, // shared error
    'import/no-unresolved': 0, // shared error
    'import/extensions': 0, // shared error
    'react/require-default-props': 0, // shared error
    'react/no-danger': 0, // dangerouslySetInnerHTML - there's no need for eslint to warn us about an attribute to with 'dangerous' in the name.
    'comma-dangle': <x-color><param>#2d9574</param>[</x-color>1, "only-multiline"<x-color><param>#2d9574</param>]</x-color>,
  <x-color><param>#bc6ec5</param>}</x-color>
<x-color><param>#4f97d7</param>}</x-color>;
