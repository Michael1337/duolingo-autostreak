# Use the official Node.js image
FROM node:14

# Install cron
RUN apt-get update && apt-get install -y cron

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Give execute permission to the cron job script
RUN chmod +x /app/get-log.sh

# Configure the cron
# Copy file to the cron.d directory
COPY cron /etc/cron.d/cron

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/cron

# Apply cron job
RUN crontab /etc/cron.d/cron

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# Start the cron
CMD cron && tail -f /var/log/cron.log
