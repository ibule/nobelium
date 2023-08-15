
# Install dependencies only when needed
FROM node:20.4.0-alpine3.18 AS deps
# Check https://github.com/nodejs/docker-node/tree/b4117f9333da4138b03a546ec926ef50a31506c3#nodealpine to understand why libc6-compat might be needed.
RUN apk add --no-cache libc6-compat
WORKDIR /app
COPY package.json  ./
RUN yarn install

# Rebuild the source code only when needed
FROM node:20.4.0-alpine3.18 AS builder
WORKDIR /app
COPY . .
COPY --from=deps /app/node_modules ./node_modules
RUN  yarn build
ARG NOTION_PAGE_ID
ENV NODE_ENV=production
ENV NOTION_PAGE_ID=NOTION_PAGE_ID
EXPOSE 3000

# Next.js collects completely anonymous telemetry data about general usage.
# Learn more here: https://nextjs.org/telemetry
# Uncomment the following line in case you want to disable telemetry.
# ENV NEXT_TELEMETRY_DISABLED 1

CMD ["yarn", "start"]
