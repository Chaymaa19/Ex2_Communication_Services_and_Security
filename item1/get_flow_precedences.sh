#!/bin/bash

# Capture file
capture_file="EX2_P1.pcapng"

# Filter expressions
tap0_filter="ip.src==11.0.0.1"
tap1_filter="ip.src==12.0.0.1"

# Run tshark to extract all unique values of ip.dsfield.dscp for each flow
unique_dscp_tap0=$(tshark -r $capture_file -Y "$tap0_filter" -T fields -e ip.dsfield.dscp | sort -n | uniq | tr '\n' ' ')
unique_dscp_tap1=$(tshark -r $capture_file -Y "$tap1_filter" -T fields -e ip.dsfield.dscp | sort -n | uniq)

# Output the results
echo "Unique DSCP values for traffic flow from 11.0.0.1: $unique_dscp_tap0"
echo "Unique DSCP values for traffic flow from 12.0.0.1: $unique_dscp_tap1"


