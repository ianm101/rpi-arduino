#!/bin/bash
echo "Hook script running..."
echo "Starting git pull"
git pull origin main
echo "Git pull complete"
echo "Starting upload script..."
./upload_script.sh
echo "Done with upload script..."
