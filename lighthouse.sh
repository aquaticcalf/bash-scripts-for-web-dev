#!/bin/bash

# Usage: ./lighthouse.sh <url>
URL=${1:-"https://example.com"}
REPORT_DIR="lighthouse-reports"
mkdir -p $REPORT_DIR

REPORT_FILE="$REPORT_DIR/$(date +%Y%m%d-%H%M%S).html"

npx lighthouse $URL --output html --output-path $REPORT_FILE
echo "lighthouse report saved to $REPORT_FILE"
