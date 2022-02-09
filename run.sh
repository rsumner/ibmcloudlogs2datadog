#!/bin/bash
if [ -z "${BOOTSTRAP_SERVERS}" ]; then
  echo "No BOOTSTRAP_SERVERS env found"
  exit 1
fi
if [ -z "${IBMCLOUD_APIKEY}" ]; then
  echo "N IBMCLOUD_APIKEY env found"
  exit 1
fi
if [ -z "${DATADOG_APIKEY}" ]; then
  echo "No DATADOG_APIKEY env found"
  exit 1
fi
if [ -z "${DATADOG_TOPICS}" ]; then
  echo "No DATADOG_TOPICS env found"
fi
sed -i 's/BOOTSTRAP_SERVERS/'"$BOOTSTRAP_SERVERS"'/' kafka/config/connect-standalone.properties
sed -i 's/IBMCLOUD_APIKEY/'"$IBMCLOUD_APIKEY"'/' kafka/config/connect-standalone.properties
sed -i 's/DATADOG_APIKEY/'"$DATADOG_APIKEY"'/' kafka/config/datadog.properties
sed -i 's/DATADOG_TOPICS/'"$DATADOG_TOPICS"'/' kafka/config/datadog.properties
kafka/bin/connect-standalone.sh kafka/config/connect-standalone.properties kafka/config/datadog.properties
