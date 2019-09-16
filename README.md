# Docker PHP Website

This PHP development environment is based on Docker.

# Installation

1, Clone repo

```
git clone git@github.com:babytomas/Docker-PHP-Website.git
```

2, Copy .env example

```
cd Docker-PHP-Website
cp SourceFiles/.env.example SourceFiles/.env
```

3, Run container

```
docker-compose up -d
```

# Configuration

If you want to change the environment configuration, you can modify the `SourceFiles/.env` file and execute `docker-compose up -d --build` to build again.
