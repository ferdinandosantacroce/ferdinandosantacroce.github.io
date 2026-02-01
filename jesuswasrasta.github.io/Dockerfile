FROM ruby:3.1-alpine

# Docker image for Jekyll blog with GitHub Pages support
LABEL maintainer="jesuswasrasta"

# Install system dependencies
RUN apk add --no-cache \
    build-base \
    curl \
    wget \
    bash \
    cmake \
    git \
    nodejs \
    npm \
    libxml2-dev \
    libxslt-dev \
    readline-dev \
    zlib-dev \
    libffi-dev \
    && rm -rf /var/cache/apk/*

# Set working directory
WORKDIR /srv/jekyll

# Copy Gemfile and package.json for dependency installation
COPY Gemfile* ./
COPY package*.json ./

# Install Ruby gems
RUN bundle config set --local path 'vendor/bundle' && \
    bundle install

# Install Node.js dependencies
RUN npm install

# Expose port 4000
EXPOSE 4000

# Default command to serve Jekyll
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--incremental", "--drafts"]