#!/usr/bin/env bash
# Copyright 2021 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# [START cloudrun_fuse_script]
#!/usr/bin/env bash
set -eo pipefail

# Create mount directory for service
# mkdir -p $MNT_DIR

# echo "Mounting GCS Fuse."
# gcsfuse --debug_gcs --debug_fuse $BUCKET /geoserver/ 
# echo "Mounting completed."

# curl -sSL https://sdk.cloud.google.com | bash
echo "USE GSUTIL"

echo "Starting Backup DATA_DIR & Capas"
gsutil -m cp -r gs://$BUCKET/$LAYER/data_dir /opt/geoserver && gsutil -m cp -r gs://$BUCKET/$LAYER/documentos /opt/geoserver
#gsutil -m cp -r gs://geomanguera/capas /opt/geoserver
echo "Backup DATA_DIR & Capas Complete"

# Crontab
# chmod ugo+x /app/backup.sh
# chmod ugo+x /app/cronjob.sh

# /app/cronjob.sh

# echo "0 * * * * /app/backup.sh >> /var/log/cron.log 2>&1
# # This extra line makes it a valid cron" > scheduler.txt

# crontab scheduler.txt
# cron -f


# Run the web service on container startup. Here we use the gunicorn
# webserver, with one worker process and 8 threads.
# For environments with multiple CPU cores, increase the number of workers
# to be equal to the cores available.
# Timeout is set to 0 to disable the timeouts of the workers to allow Cloud Run to handle instance scaling.
# exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 main:app &

# Exit immediately when one of the background processes terminate.
# wait -n


su $USER --command "/scripts/entrypoint.sh"

# exec /usr/local/tomcat/bin/catalina.sh run &
#     # Exit immediately when one of the background processes terminate.
#     wait -n

# [END cloudrun_fuse_script]
