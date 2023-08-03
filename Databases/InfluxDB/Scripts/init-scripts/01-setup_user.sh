#!/bin/bash

# Wait for the InfluxDB service to be available
until curl -s "http://$INFLUXDB_HOST:$INFLUXDB_PORT/health" 2>&1 | grep 'ready' >/dev/null; do
  >&2 echo "InfluxDB is unavailable - sleeping"
  sleep 1
done

# Check if InfluxDB user already exists
if ! curl -s "http://$INFLUXDB_HOST:$INFLUXDB_PORT/api/v2/users" -u "$INFLUXDB_USERNAME:$INFLUXDB_PASSWORD" | grep "\"name\":\"$INFLUXDB_USERNAME\"" >/dev/null; then
  # Create the InfluxDB user
  curl -s -X POST "http://$INFLUXDB_HOST:$INFLUXDB_PORT/api/v2/users" -u "$INFLUXDB_USERNAME:$INFLUXDB_PASSWORD" -H "Content-Type: application/json" -d "{\"name\":\"$INFLUXDB_USERNAME\",\"password\":\"$INFLUXDB_PASSWORD\"}"
  echo "User '$INFLUXDB_USERNAME' created with password '$INFLUXDB_PASSWORD'."
fi

'''
# Check if InfluxDB user already exists
if ! influx --host "$INFLUXDB_HOST" --port "$INFLUXDB_PORT" user find --name "$INFLUXDB_USERNAME"; then
  # Create the InfluxDB user
  influx --host "$INFLUXDB_HOST" --port "$INFLUXDB_PORT" user create --name "$INFLUXDB_USERNAME" --password "$INFLUXDB_PASSWORD"
  echo "User '$INFLUXDB_USERNAME' created with password '$INFLUXDB_PASSWORD'."
fi
'''