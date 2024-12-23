#!/bin/bash

# Overwatch: Automated Vulnerability Scanning and Notification Script.
# -----------------------------------------------------------
# This script automates the following tasks:
# 1. Spins up Axiom instances for scanning.
# 2. Enumerates subdomains using `subfinder`.
# 3. Probes HTTP services using `httpx`.
# 4. Runs vulnerability scans with Nuclei for medium, high, and critical severities.
# 5. Immediately notifies the user upon detecting critical or high findings.
# 6. Periodically reports medium findings and sleeps for 30 hours before repeating.
# -----------------------------------------------------------
# Author: Made with <3 by tess.
# Last Updated: 12/23/2024

while true; do
  echo "Starting axiom-fleet..." | notify
  axiom-fleet --instances 30 -silent || { echo "Axiom fleet setup failed!" | notify; exit 1; }

  echo "Running subdomain enumeration with axiom-scan..." | notify
  axiom-scan subdomains.txt -m subfinder -all -o subs.txt || { echo "Subfinder scan failed!" | notify; exit 1; }
  echo "Subdomain enumeration completed." | notify

  echo "Running HTTP probing with axiom-scan..." | notify
  axiom-scan subs.txt -m httpx -o resolved.txt || { echo "HTTPx scan failed!" | notify; exit 1; }
  echo "HTTP probing completed." | notify

  echo "Starting Nuclei scans..." | notify
  axiom-scan resolved.txt -m nuclei --severity medium,high,critical -o hits.txt --rm-when-done || { echo "Nuclei scan failed!" | notify; exit 1; }
  echo "Nuclei scans completed. Deleted axiom spins." | notify

  # Notify on critical findings immediately
  if grep -qi "critical" hits.txt; then
    echo "Critical finding detected!" | notify
    grep -i "critical" hits.txt | notify
  fi

  # Notify on high findings immediately
  if grep -qi "high" hits.txt; then
    echo "High findings detected!" | notify
    grep -i "high" hits.txt | notify
  fi

  # Notify about medium findings periodically
  echo "Medium findings:" | notify
  grep medium hits.txt | notify

  echo "Sleeping for 30 hours (108000 seconds)... See you soon!" | notify
  sleep 108000 # 30 hours
done
