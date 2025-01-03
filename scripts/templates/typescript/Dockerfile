FROM node@sha256:0e910f435308c36ea60b4cfd7b80208044d77a074d16b768a81901ce938a62dc

WORKDIR /usr/src/app
RUN npm i -g pnpm
COPY package*.json ./
COPY pnpm-lock.yaml ./
RUN pnpm install
COPY . .
RUN pnpm build
ENV NODE_ENV=production
EXPOSE 3000
CMD [ "node", "dist/index.js" ]
