/**
 * To not forget the rules
 */

module.exports = {
  node: {
    'prettier/prettier': 'error',
    'class-methods-use-this': 'off',
    'no-param-reassign': 'off',
    camelcase: 'off',
    'no-unused-vars': ['error', { argsIgnorePattern: 'next' }],
	},
  React: {
	'prettier/prettier': 'error',
	'react/jsx-filename-extension': [
		'warn',
		{ extensions: ['.js', '.jsx'] },
	],
	'import/prefer-default-export': 'off',
	'no-param-reassign': 'off',
	'no-console': ['error', { allow: ['tron'] }],
	'react-hooks/rules-of-hooks': 'error',
	'react-hooks/exhaustive-deps': 'warn',
  }
};

/**
 * Install:
 * 	- eslint-config-prettier
 * 	- eslint-plugin-prettier
 * 	- eslint-plugin-react-hooks -> for react
 */
