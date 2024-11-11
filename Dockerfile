# FROM node:lts as build-stage
# WORKDIR /nuxtapp
# COPY package*.json ./
# RUN npm install
# COPY . .
# RUN npm run build
# FROM node:lts as prod-stage

# # Set the working directory
# WORKDIR /nuxtapp

# # Copy only the production dependencies from the build stage
# COPY --from=build-stage /nuxtapp/node_modules ./node_modules
# COPY --from=build-stage /nuxtapp/package*.json ./
# COPY --from=build-stage /nuxtapp/.output ./.output

# # Expose the port your app runs on (default for Nuxt is 3000)
# EXPOSE 3000

# # Define the command to start the application
# CMD ["npm", "run", "start"]

# Use a base Node image
# FROM node:lts as build-stage

# # Set the working directory
# WORKDIR /app

# # Copy the package files
# COPY package*.json ./

# # Install dependencies
# RUN npm install

# # Copy the rest of the application code
# COPY . .

# # Build the application for production
# RUN npm run build

# # Production image
# FROM node:lts as prod-stage

# # Set the working directory
# WORKDIR /app

# # Copy only the production dependencies from the build stage
# COPY --from=build-stage /app/node_modules ./node_modules
# COPY --from=build-stage /app/package*.json ./
# COPY --from=build-stage /app/.output ./.output

# # Expose the port your app runs on (default for Nuxt is 3000)
# EXPOSE 3000

# # Define the command to start the application
# CMD ["npm", "run", "start"]

FROM node:lts as build-stage
WORKDIR /nuxtapp
COPY . .
RUN npm install
RUN npm run build
RUN rm -rf node_modules && \
  NODE_ENV=production npm install \
  --prefer-offline \
  --pure-lockfile \
  --non-interactive \
  --production=true
FROM node:lts as prod-stage
WORKDIR /nuxtapp
COPY --from=build-stage /nuxtapp/.output/  ./.output/
CMD [ "node", ".output/server/index.mjs" ]