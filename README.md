# Docker PHP Website

This PHP development environment is based on Docker.

# Installation

##### Clone repo to your path

You must have git installed, then execute the following command on the terminal

```
git clone git@github.com:babytomas/Docker-PHP-Website.git
```

##### Install environment

Run the install script and configuration your environment software version

```
cd Docker-PHP-Website/SourceFiles
chmod +x install.sh
./install.sh
```

# Operations

You must `cd Docker-PHP-Website/SourceFiles` to enter the path before your operation.

##### Base operation

```
docker-compose -p <app_name> start # Start
docker-compose -p <app_name> stop # Stop
docker-compose -p <app_name> restart # Restart
```

##### Remove container

Deleting a container won't cause your file to be deleted, you can still keep the website configuration and files

```
docker-compose -p <app_name> down
```

##### Remove images

```
docker images # Show all images, you can find the image ID
docker rmi <your_image_id> # Remove image by ID
```

# Change or upgrade software

If you want to change the environment configuration, you can modify the `SourceFiles/.env` file and execute `docker-compose -p <app_name> up -d --build` to rebuild.

# Other

Author: Cheuknang Chiang <mail@cheuknang.cn>

Official website: https://www.geebastudio.com Project website: https://docker.cx

# Copyright and license

Copyright &copy; 2020 Hostribe Technology Co., Ltd. All Rights Reserved. Code released under the [MIT License](./LICENSE).
