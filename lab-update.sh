#!/usr/bin/bash
#
# This script, if present in your vpodrepo root, is run at the end of labsartup.
# It is called during the "final.py"
# Here's the overall flow:
# prelim.py -> ESXi.py -> VCF.py -> VVF.py -> vSphere.py -> pings.py -> services.py -> Kubernetes.py -> urls.py -> VCFfinal.py -> final.py -> odyssey.py 
#
# If you prefer scripting in Python:
# You may optionally place a "lab-update.py" in this folder and it would be called immediately folling the call of this lab-update.sh script
# 
# Source the .bashrc file for settings/paths/etc...
. /home/holuser/.bashrc
# Insert your custom code here:

FTorPROD="/tmp/deploymentpool.txt"


#Commands run here will only run if the vPod is in Functial Testing or Production. They will not run in HOL DEV
if [ -f "$FTorPROD" ]; then
    #ansible-galaxy collection install /vpodrepo/2027-labs/2770/lab-standup/ansible/vmware-ansible_for_vdefend-1.0.1.tar.gz
    
    #Push Management Domain Security Configuration
    ansible-playbook /vpodrepo/2027-labs/2770/lab-standup/mgmt-domain/vDefend_DFW_Configuration.yml | tee -a /lmchol/hol/labstartup.log >> /home/holuser/hol/labstartup.log 2>&1
    
    #Push 3-Tier Application Configuration
    ansible-playbook /vpodrepo/2027-labs/2770/lab-standup/lab-build.yml | tee -a /lmchol/hol/labstartup.log >> /home/holuser/hol/labstartup.log 2>&1
    
    #Enable Flowgen Topologies needed at boot. Any changes should be made in the enable-vmflowgen.sh file by uncommenting the line
    chmod +x /vpodrepo/2027-labs/2770/lab-standup/enable-vmflowgen.sh
    /bin/bash /vpodrepo/2027-labs/2770/lab-standup/enable-vmflowgen.sh | tee -a /lmchol/hol/labstartup.log >> /home/holuser/hol/labstartup.log 2>&1
fi

# Example to echo text into file on Console VM. 
# NOTE: when this script runs, /lmchol is mounted to the "/" of the Console VM
# echo "Functional Testing!" > /lmchol/home/holuser/Documents/FT.txt