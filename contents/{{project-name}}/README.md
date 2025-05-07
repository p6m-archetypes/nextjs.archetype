# `@p6m-dev` NextJS

## Run tasks

To run the dev server for your app, use:

```sh
pnpm dev
```

To create a production bundle:

```sh
pnpm build 
```

To see all available targets to run for a project, run:

```sh
pnpm nx show project {{package-name}}
```

To sync with API swagger changes, run:

```sh
pnpm api:sync
```

See configuration in `orval.config.ts` file. orval is able to generate client with appropriate type-signatures (TypeScript) from any valid OpenAPI v3 or Swagger v2 specification, either in yaml or json formats. Learn more about orval [here](https://orval.dev/).

## Install Nx Console

Nx Console is an editor extension that enriches your developer experience. It lets you run tasks, generate code, and improves code autocompletion in your IDE. It is available for VSCode and IntelliJ.

[Install Nx Console &raquo;](https://nx.dev/getting-started/editor-setup?utm_source=nx_project&utm_medium=readme&utm_campaign=nx_projects)

## Useful links

Learn more:

- [NextJS](https://nextjs.org/)
- [Learn more about this workspace setup](https://nx.dev/nx-api/next?utm_source=nx_project&amp;utm_medium=readme&amp;utm_campaign=nx_projects)
- [Shadcn UI](https://ui.shadcn.com/)
- [Tailwind CSS](https://tailwindcss.com/)
- [Orval](https://orval.dev/)
