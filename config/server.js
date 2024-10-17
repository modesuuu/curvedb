module.exports = ({ env }) => ({
  host: env('HOST', '0.0.0.0'),
  port: env.int('PORT', 1337),
  app: {
    keys: env.array('APP_KEYS',['w3Fq7T+G7XqM8gGpBz7nS5JqY0W3QwP7', 'Jj4c5E8u3H9vU4h7xQ8zH2vS0T5pB7q6']),
  },
  webhooks: {
    populateRelations: env.bool('WEBHOOKS_POPULATE_RELATIONS', false),
  },
});
