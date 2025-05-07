import { defineConfig } from 'orval';

export default defineConfig({
    productSystems: {
      output: {
        mode: 'tags-split',
        target: 'src/swagger/api/generated',
        schemas: 'src/swagger/api/generated/model',
        client: 'fetch',
        mock: false,
      },
      input: {
        target: './example-swagger.json', // Swap this out for your swagger file or endpoint
      },
    },
  });