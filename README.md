# ibmcloudlogs2datadog

Container that runs a standalone instance Kafka Connect to sink logs IBM Cloud logs stored in a IBM Cloud Event Streams (Kafka) topic to Datadog logs.

Requires the following Envrionment variables to be passed in:

* `BOOTSTRAP_SERVERS` - list of Kafka brokers (separated by comma) to connect to.  Get this from the Event Streams service key
* `IBMCLOUD_APIKEY` - API key for the Event Streams service key
* `DATADOG_APIKEY` - Datadog API Key 
* `DATADOG_TOPICS` - Event Streams topics to push consume and push to Datadog logs

Container details:

* Base container is ubi8/openjdk-17-runtime
* Added binary distrubtion of Apache Kafka 3.1.0
* Added https://github.com/DataDog/datadog-kafka-connect-logs as a Kafka Connect plugin
