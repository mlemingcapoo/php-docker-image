# Use PHP 8.4 CLI image as the base
FROM php:8.4-cli

# Install necessary dependencies and PHP extensions
RUN apt-get update && apt-get install -y \
    libmariadb-dev \
    libzip-dev \
    libpng-dev \
    libpq-dev \
    nodejs \
    npm \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    && docker-php-ext-install pdo_mysql zip gd bcmath \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory inside the container
WORKDIR /app

# Copy the entrypoint script into the container
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["docker-entrypoint.sh"]

# Default command (can be overridden)
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8010"]

# Expose the port for Laravel development server
EXPOSE 8010

