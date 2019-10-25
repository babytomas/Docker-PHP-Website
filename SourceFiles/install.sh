#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

# Check docker & docker-compose
if ! [ -x "$(command -v docker)" ]; then
  # Install git /  docker & docker-compose
  # ...

  echo "Error: Please install docker & docker-compose, and try again later"
  exit 1
fi

# Check docker image exists
checkDockerImage()
{
    curl --silent -f -lSL https://index.docker.io/v1/repositories/$1/tags/$2 > /dev/null
}

# Start page
clear
echo "---------------------------------------------------------------------------"
echo ""
echo "           Install PHP development environment based on Docker"
echo ""
echo "                         Website: https://docker.cx"
echo ""
echo -e "                       \033[1;41;37m [ Press enter to continue ] \033[0m"
echo ""
echo "---------------------------------------------------------------------------"
read -p ""
clear

# Set the app name
read -p "App name ( default is 'test' ): " APP_NAME

# Default name is 'test'
if [ "$APP_NAME" = "" ]; then
    APP_NAME="test"
fi

# Set the root path
read -p "Web root path ( default is '../Develop' ):" ROOT_PATH

# Default path is '../Develop'
if [ "$ROOT_PATH" = "" ]; then
    ROOT_PATH="../Develop"
fi

# Set the PHP version
while true; do
  read -p "PHP version ( default is '7.3' ): " PHP_VERSION

  # Default version is '7.3'
  if [ "$PHP_VERSION" = "" ]; then
      PHP_VERSION="7.3"
  fi

  # Check PHP image
  # echo "Check if PHP image exist..."
  if [ ! -z $(docker images -q php:${PHP_VERSION}-fpm) ]; then
    break
  else
    if checkDockerImage php ${PHP_VERSION}-fpm; then
      # Pull PHP image in Docker
      echo "Can't find local PHP $PHP_VERSION image, pulling from docker registry..."
      docker pull php:${PHP_VERSION}-fpm
      if [ ! -z $(docker images -q php:${PHP_VERSION}-fpm) ]; then
        break
      fi

      # Failed to download, maybe network error
      echo "Error: Failed to download PHP image, please check your network and try again later."
      exit 1
    else
      # Failed to download, because PHP version is wrong
      # clear
      echo -e "Error: PHP $PHP_VERSION not exists, please check in \033[1;41;33m https://www.php.net/downloads.php \033[0m and re-enter the correct version. \n"
    fi
  fi
done

# Set the MySQL version
while true; do
  read -p "MySQL version ( default is '5.7' ): " MYSQL_VERSION

  # Default version is '5.7'
  if [ "$MYSQL_VERSION" = "" ]; then
      MYSQL_VERSION="5.7"
  fi

  # Check MySQL image
  # echo "Check if MySQL image exist..."
  if [ ! -z $(docker images -q mysql:${MYSQL_VERSION}) ]; then
    break
  else
    if checkDockerImage mysql ${MYSQL_VERSION}; then
      # Pull MySQL image in Docker
      echo "Can't find local MySQL $MYSQL_VERSION image, pulling from docker registry..."
      docker pull mysql:${MYSQL_VERSION}
      if [ ! -z $(docker images -q mysql:${MYSQL_VERSION}) ]; then
        break
      fi

      # Failed to download, maybe network error
      echo "Error: Failed to download MySQL image, please check your network and try again later."
      exit 1
    else
      # Failed to download, because MySQL version is wrong
      # clear
      echo -e "Error: MySQL $MYSQL_VERSION not exists, please check in \033[1;41;33m https://dev.mysql.com/downloads/mysql \033[0m and re-enter the correct version. \n"
    fi
  fi
done

# Set the mysql root password
read -p "MySQL password ( default is 'password' ): " MYSQL_PASSWORD

# Default password is 'password'
if [ "$MYSQL_PASSWORD" = "" ]; then
    MYSQL_PASSWORD="password"
fi

# Set the Nginx version
while true; do
  read -p "Nginx version ( default is 'latest' ): " NGINX_VERSION

  # Default version is 'latest'
  if [ "$NGINX_VERSION" = "" ]; then
      NGINX_VERSION="latest"
  fi

  # Check Nginx image
  # echo "Check if Nginx image exist..."
  if [ ! -z $(docker images -q nginx:${NGINX_VERSION}) ]; then
    break
  else
    if checkDockerImage nginx ${NGINX_VERSION}; then
      # Pull Nginx image in Docker
      echo "Can't find local Nginx $NGINX_VERSION image, pulling from docker registry..."
      docker pull nginx:${NGINX_VERSION}
      if [ ! -z $(docker images -q nginx:${NGINX_VERSION}) ]; then
        break
      fi

      # Failed to download, maybe network error
      echo "Error: Failed to download Nginx image, please check your network and try again later."
      exit 1
    else
      # Failed to download, because Nginx version is wrong
      # clear
      echo -e "Error: Nginx $NGINX_VERSION not exists, please check in \033[1;41;33m https://nginx.org/en/download.html \033[0m and re-enter the correct version. \n"
    fi
  fi
done

# Clean configuration
echo "" > .env

# Set configuration
echo "APP_NAME=$APP_NAME\n
ROOT_PATH=$ROOT_PATH\n
PHP_VERSION=$PHP_VERSION\n
NGINX_VERSION=$NGINX_VERSION\n
MYSQL_VERSION=$MYSQL_VERSION\n
MYSQL_PASSWORD=$MYSQL_PASSWORD" >> .env

# Download ionCube, or use local version
# ...

# Download phpMyAdmin, or use local version
# ...

# Install apache
# ...

# Install redis
# ...

# Install memcached
# ...

# Check ports
# ...

# Build and run on docker-compose
docker-compose up -d
