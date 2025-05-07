FROM ybor/node:18-bullseye
WORKDIR /app

ENV NODE_ENV=production

RUN groupadd -g 1001 -r nodejs
RUN useradd -r nextjs -u 1001

COPY --chown=nextjs:nodejs .next/standalone .
COPY --chown=nextjs:nodejs .next/static .next/static
COPY --chown=nextjs:nodejs public ./public


USER nextjs

EXPOSE 3000

ENV PORT 3000

CMD ["node", "apps/studio/server.js"]
