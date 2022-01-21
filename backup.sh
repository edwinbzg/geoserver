#!/bin/bash
echo "Upload backup data_dir"
gsutil -m cp -r /opt/geoserver/data_dir gs://geomanguera/data_dir
echo "Backup data_dir complete"