#!/usr/bin/env bash

if [ "$APP_IP" ]; then
    if [ "$APP_HOST" ]; then
        echo "Adding entry to hosts"
	echo "$APP_IP $APP_HOST" >> /etc/hosts
    fi
fi

su - seluser -c /opt/bin/entry_point.sh
