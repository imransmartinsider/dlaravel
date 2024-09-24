# Use the official PHP 8.1 FPM image as the base
FROM php:8.1-fpm

# Set working directory
WORKDIR /var/www/laravel-app

# Install system dependencies and PHP extensions
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libzip-dev \
    libpq-dev \
    && docker-php-ext-install pdo pdo_mysql mbstring exif pcntl bcmath gd zip

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy existing application directory contents
COPY . /var/www/laravel-app

# Expose port 9000 and start PHP-FPM server
EXPOSE 9000
CMD ["php-fpm"]
