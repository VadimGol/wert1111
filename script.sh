#!/bin/bash
touch daemon-arp.sh
chmod 755 daemon-arp.sh
echo "ip neigh show dev enp0s3
sleep 60" > daemon-arp.sh
echo "[Unit]
  Description=arp checking
  After=network.target

[Service]
  Type=simple
  ExecStart=/bin/bash -u /opt/daemon-arp.sh
  Type=idle
  KillMode=process

  SyslogIdentifier=arp-checking
  SyslogFacility=daemon

  Restart=always

[Install]
  WantedBy=multiuser.target" > /usr/lib/systemd/system/check-arp-1.service
systemctl start check-arp-1
#Hello
