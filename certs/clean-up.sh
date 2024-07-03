#!/bin/bash

echo "remove certificados"
rm ca-siem-key.pem
rm ca-siem.pem
rm siem-key.pem
rm siem.pem
rm siem.chain.pem
rm certs.exist

echo "remove locks do setup do fleet e kibana"
rm fleet_setup.exist
rm kibana_user.exist

