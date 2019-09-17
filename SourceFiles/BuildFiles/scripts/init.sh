#!/bin/bash

# Change the time zone
ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Change the mirror origin
# ...
