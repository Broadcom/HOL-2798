#!/bin/bash

#This script will Deploy VMflowgen toplogies for HOL2770
#The PW variable requires the file listed to be present as it is on the manager VM.
#This script will not work on the LMC

vPodPW=$(</home/holuser/creds.txt) 

#Copy over the active HOL topologies

sshpass -p $vPodPW scp /vpodrepo/2027-labs/2770/vmflowgen/active-topologies/vdefendfirewalldemo.yaml root@vmflowgen.site-a.vcf.lab:/opt/vmware/vmflowgen/topologies/vdefendfirewalldemo.yaml
#sshpass -p $vPodPW scp /vpodrepo/2027-labs/2770/vmflowgen/active-topologies/atp.yaml root@vmflowgen.site-a.vcf.lab:/opt/vmware/vmflowgen/topologies/atp.yaml
sshpass -p $vPodPW scp /vpodrepo/2027-labs/2770/vmflowgen/active-topologies/baremetal.yaml root@vmflowgen.site-a.vcf.lab:/opt/vmware/vmflowgen/topologies/baremetal.yaml
sshpass -p $vPodPW scp /vpodrepo/2027-labs/2770/vmflowgen/active-topologies/idpsdemo.yaml root@vmflowgen.site-a.vcf.lab:/opt/vmware/vmflowgen/topologies/idpsdemo.yaml
sshpass -p $vPodPW scp /vpodrepo/2027-labs/2770/vmflowgen/active-topologies/malwarepreventiondemo.yaml root@vmflowgen.site-a.vcf.lab:/opt/vmware/vmflowgen/topologies/malwarepreventiondemo.yaml
sshpass -p $vPodPW scp /vpodrepo/2027-labs/2770/vmflowgen/active-topologies/ndr-external-sensor.yaml root@vmflowgen.site-a.vcf.lab:/opt/vmware/vmflowgen/topologies/ndr-external-sensor.yaml
#sshpass -p $vPodPW scp /vpodrepo/2027-labs/2770/vmflowgen/active-topologies/security-journey.yaml root@vmflowgen.site-a.vcf.lab:/opt/vmware/vmflowgen/topologies/security-journey.yaml

sshpass -p $vPodPW ssh root@vmflowgen.site-a.vcf.lab  'systemctl restart vmflowgen'