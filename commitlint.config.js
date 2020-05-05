module.exports = {
    extend: ['@commitlint/config-conventional'],
    rules: {
      'type-enum': [
        2,
        'always',
        ['build', 'chore', 'ci', 'docs', 'feat', 'fix', 'perf', 'refactor', 'revert', 'style', 'test']
      ]
    }
  }