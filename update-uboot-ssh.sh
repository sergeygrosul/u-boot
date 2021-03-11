A20_IP="192.168.1.117"
PASS="adatis"
FILE=u-boot-sunxi-with-spl.bin

#ssh -oStrictHostKeyChecking=no root@$A20_IP uptime
ssh-keygen -R $A20_IP
sshpass -p $PASS ssh -o StrictHostKeyChecking=no root@$A20_IP uptime

sshpass -p $PASS scp ./$FILE root@$A20_IP:/root


sshpass -p $PASS ssh root@$A20_IP 'dd if=/dev/zero of=/dev/mmcblk0 bs=1k count=1023 seek=1 status=noxfer'
sshpass -p $PASS ssh root@$A20_IP "dd if=/root/${FILE} of=/dev/mmcblk0 bs=1024 seek=8 status=noxfer"
sshpass -p $PASS ssh root@$A20_IP 'sync'
sshpass -p 'adatis' ssh root@$A20_IP 'reboot'

echo Done