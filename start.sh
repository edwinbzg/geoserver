#!/bin/bash

# Start the first process
/app/cronjob.sh &
  
# Start the second process
/app/gcsfuse_run.sh &
  
# Wait for any process to exit
wait -n
  
# Exit with status of process that exited first
exit $?
