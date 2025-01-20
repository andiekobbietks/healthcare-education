FROM gitpod/workspace-full

# Install necessary dependencies
RUN sudo apt-get update && sudo apt-get install -y \
    curl \
    git \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev \
    python3-pip

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash - && \
    sudo apt-get install -y nodejs

# Install Yarn
RUN npm install -g yarn

# Set the working directory
WORKDIR /workspace/healthcare-education

# Install project dependencies
COPY package.json yarn.lock ./
RUN yarn install

# Copy the rest of the application code
COPY . .

# Expose the application port
EXPOSE 3000

# Start the development server
CMD ["yarn", "start"]
