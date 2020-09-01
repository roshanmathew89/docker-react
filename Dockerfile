FROM node:alpine AS builder
WORKDIR /apps
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# this is the run phase start , FROM statement marks the begin of the new stage and end of the previous stage
FROM nginx

# we using the builder stage defined above to reference the /apps/build folder from the builde stage image
COPY --from=builder  /apps/build /usr/share/nginx/html

