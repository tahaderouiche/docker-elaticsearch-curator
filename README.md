# Elasticsearch  curator

## Description

This repository contains the image for elasticsearch curator.
Elasticsearch Curator helps you curate, or manage, your Elasticsearch indices and snapshots by:

1. Obtaining the full list of indices (or snapshots) from the cluster, as the actionable list
2. Iterate through a list of user-defined filters to progressively remove indices (or snapshots) from this actionable list as needed.
3. Perform various actions on the items which remain in the actionable list.

Elasticsearch curator documentation can be found on the [Elastic web site](https://www.elastic.co/guide/en/elasticsearch/client/curator/current/about.html).


## Usage
This image is meant to be run as a cronjob (in the case of time-based index housekeeping).

### Example
To deleting the metricbeat-* and logstash-* indexes older than 7 days on a localhost elasticsearch
```
docker run --rm \
--name elasticsearch-curator \
-e INDICES_MAX_7_DAYS="^(metricbeat|logstash).*$" \
-e ELASTICSEARCH_HOSTNAME="localhost" \
-e ELASTICSEARCH_PORT="9200" \
-e ELASTICSEARCH_USERNAME_PASSWORD="elastic:changeme" \
tahaderouiche/elasticsearch-curator
```

## Other usages
To perform other actions (Snapshot, Restore, etc)
1. Create a separate action file
2. Bind mount the file to the config directory
3. Pass that file to the docker run command
4. Update the environment variables accordingly

 ### Example
 After creating an action file, save it to /full_path_to/

```
docker run --rm \
--name elasticsearch-curator \
-e ELASTICSEARCH_HOSTNAME="localhost" \
-e ELASTICSEARCH_PORT="9200" \
-e ELASTICSEARCH_USERNAME_PASSWORD="elastic:changeme" \
-v full_path_to/action_file.yml:/config/action_file.yml \
tahaderouiche/elasticsearch-curator \
"/config/action_file.yml"
```
## Supported Docker versions
The images have been tested on Docker 17.03.1-ce.





This image is built on [CentOS 7](https://github.com/CentOS/sig-cloud-instance-images/blob/CentOS-7/docker/Dockerfile).
This is in line with the other official elastic docker images. Find more details in this [blog post](https://www.elastic.co/blog/docker-base-centos7).