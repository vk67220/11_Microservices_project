#!/bin/bash

apt-get update -y
apt-get install -y apache2

systemctl start apache2
systemctl enable apache2

echo "<h1>Terraform + EBS</h1>" > /var/www/html/index.html

# 🔥 WAIT UNTIL EBS IS AVAILABLE (CRITICAL)
while [ ! -e /dev/nvme1n1 ]; do
  echo "Waiting for EBS volume..."
  sleep 5
done

DEVICE="/dev/nvme1n1"

echo "EBS Found: $DEVICE"

# 🔥 FORMAT ONLY IF NEEDED
if ! blkid $DEVICE; then
  mkfs -t ext4 $DEVICE
fi

# 🔥 CREATE MOUNT POINT
mkdir -p /data

# 🔥 MOUNT
mount $DEVICE /data

# 🔥 ADD TO FSTAB (PERSIST)
UUID=$(blkid -s UUID -o value $DEVICE)
echo "UUID=$UUID /data ext4 defaults,nofail 0 2" >> /etc/fstab