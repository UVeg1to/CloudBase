#!/bin/bash

# Check if InfluxDB organization already exists
if ! influx --host "$INFLUXDB_HOST" --port "$INFLUXDB_PORT" org find --name "$INFLUXDB_ORG"; then
  # Create the InfluxDB organization
  influx --host "$INFLUXDB_HOST" --port "$INFLUXDB_PORT" org create --name "$INFLUXDB_ORG"
  echo "Organization '$INFLUXDB_ORG' created."
fi

# Check if InfluxDB bucket already exists
if ! influx --host "$INFLUXDB_HOST" --port "$INFLUXDB_PORT" bucket find --org "$INFLUXDB_ORG" --name "$INFLUXDB_BUCKET"; then
  # Create the InfluxDB bucket
  influx --host "$INFLUXDB_HOST" --port "$INFLUXDB_PORT" bucket create --org "$INFLUXDB_ORG" --name "$INFLUXDB_BUCKET" --retention 60d  # Replace '30d' with your desired retention policy
  echo "Bucket '$INFLUXDB_BUCKET' created in organization '$INFLUXDB_ORG'."

  # Create a token for the bucket
  INFLUXDB_TOKEN=$(influx --host "$INFLUXDB_HOST" --port "$INFLUXDB_PORT" auth create --read-bucket "$INFLUXDB_BUCKET" --write-bucket "$INFLUXDB_BUCKET" --org "$INFLUXDB_ORG" --json | jq -r '.INFLUXDB_TOKEN')

  # Save token to a file inside /var/lib/influxdb2 directory
  echo "$INFLUXDB_TOKEN" > /var/lib/influxdb2/bucket_token.txt
  echo "Token for 'mybucket' created."
fi
