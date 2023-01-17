FROM node:16-alpine as builder
# Set the working directory to /app inside the container
WORKDIR /app

COPY Dashboard .

RUN npm ci --save-dev --legacy-peer-deps
# Build the app
RUN npm run build

# # Bundle static assets with nginx
# FROM nginx:1.21.0-alpine as production
# ENV NODE_ENV production
# # Copy built assets from `builder` image
# COPY --from=builder /app/build /usr/share/nginx/html
# WORKDIR /usr/share/nginx/html
# # Expose port
# EXPOSE 80
# # Start nginx
# CMD ["nginx", "-g", "daemon off;"]