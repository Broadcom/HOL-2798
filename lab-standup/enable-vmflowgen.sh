#!/bin/bash

#This script will deploy each of the required topologies for HOL2670
#The PW variable requires the file listed to be present as it is on the manager VM.
#This script will not work on the LMC


vPodUID="admin"
vPodPW=$(</home/holuser/creds.txt) 

# ATP Demo
#curl -s -k -X POST -u ${vPodUID}:${vPodPW} https://vmflowgen.site-a.vcf.lab/apply?config_name=atp

# Baremetal Demo
#curl -s -k -X POST -u ${vPodUID}:${vPodPW} https://vmflowgen.site-a.vcf.lab/apply?config_name=baremetal

# IDPS Demo
#curl -s -k -X POST -u ${vPodUID}:${vPodPW} https://vmflowgen.site-a.vcf.lab/apply?config_name=idpsdemo

# Malware Demo
#curl -s -k -X POST -u ${vPodUID}:${vPodPW} https://vmflowgen.site-a.vcf.lab/apply?config_name=malwarepreventiondemo

# NDR External Sensor Demo
#curl -s -k -X POST -u ${vPodUID}:${vPodPW} https://vmflowgen.site-a.vcf.lab/apply?config_name=ndr-external-sensor

# vDefend Firewall demo
#curl -s -k -X POST -u ${vPodUID}:${vPodPW} https://vmflowgen.site-a.vcf.lab/apply?config_name=vdefendfirewalldemo

# Security Journey Demo
curl -s -k -X POST -u ${vPodUID}:${vPodPW} https://vmflowgen.site-a.vcf.lab/apply?config_name=security-journey

# Intelligence Demo no longer used
# curl -s -k -X POST -u ${vPodUID}:${vPodPW} https://vmflowgen.site-a.vcf.lab/apply?config_name=intelligence-hol