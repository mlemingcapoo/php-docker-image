# php84-docker-image
 Docker image for running php commands

# Setup
- Build the image with ```docker compose up --build -d```
- Setup command aliases (See Alias Functions/zshrc.txt for the example)

# Test run (```php84-dev``` is the built image name, change it to yours)
- Development server: 
```
    docker run --rm --init \
        -v "$(pwd)":/app \
        -w /app \
        -p "8010:8010" \
        php84-dev php artisan serve --host=0.0.0.0 --port="8010"
```
Note: don't change ```--host=0.0.0.0``` as it's required. Otherwise you won't be able to see your page.

- Check php version: ```docker run --rm --init -v "$(pwd)":/app -w /app php84-dev php -v```

# For local dev server
- For quick start the development server, i have made the phpdev function as an example
- Example use: ```phpdev 8000``` - ```8000``` is your favorite port number
- Or simply run ```phpdev```. The default port is ```8010```. You could change this in the alias function

# For other commands
- Just type ```php <something>```

# Issues
- I made this for my personal purpose but any suggestions is appreciated!
