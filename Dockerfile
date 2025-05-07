# Use an official Node.js runtime as a parent image
FROM node:24

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application’s source code
COPY . .

# Expose the port that your application runs on
EXPOSE 3000

# Define the command to run the application
CMD ["node", "app.js"]
