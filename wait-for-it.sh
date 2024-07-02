#!/usr/bin/env bash
# Use this script to test if a given TCP host/port are available

host="$1"
shift
cmd="$@"

until nc -z "$host" 8888; do
  >&2 echo "Config service is unavailable - sleeping"
  sleep 1
done

>&2 echo "Config service is up - executing command"
exec $cmd
