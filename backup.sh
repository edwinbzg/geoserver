#!/bin/bash
echo "Upload backup data_dir"
# gsutil -m rm -r gs://$BUCKET/data_dir && gsutil -m cp -r /opt/geoserver/data_dir gs://$BUCKET
gsutil -m cp -r /opt/geoserver/data_dir gs://$BUCKET/$LAYER
echo "Backup data_dir complete"