# PHP-Constructor-Fix
Replaces constructors named with class name to __construct in PHP files.
Useful to migrate project from PHP 5.4 or less to PHP 5.6 or latest.
If something go wrong you have backup in `.bak` files.

# Usage
##Run global
```
sudo php-cf.sh path_do_dir
Example
sudo php-cf.sh /var/www/html
```

##Run local
```
sudo ./php-cf.sh path_do_dir
Example
sudo ./php-cf.sh /var/www/html
```

# Configuration
Clone the repository
```
git clone https://github.com/rucin96/PHP-Constructor-Fix.git
```

For global use
```
sudo mv ./php-cf.sh /usr/local/bin/php-cf.sh
```