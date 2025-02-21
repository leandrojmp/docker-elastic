#!/bin/bash

echo "remove certificados"
rm -f ca-siem-key.pem
rm -f ca-siem.pem
rm -f siem-key.pem
rm -f siem.pem
rm -f siem.chain.pem
rm -f certs.exist

echo "remove locks do setup do fleet e kibana"
rm -f fleet_setup.exist
rm -f kibana_user.exist

