# Proof-of-concept Udpcast/PXEboot

- host "pxe" is de PXEBoot server, die in principe volledig geconfigureerd is
- host "udpcast" bouwt het systeem met de tool voor het klonen van pc's.
    - Het root-filesysteem van deze machine moet nog ter beschikking gesteld worden via NFS, door het in `/srv/tftproot/pxelinux/udpcast/rootfs` te kopiëren
    - De firewall moet uitgezet worden (rhbase-rol zet sowieso de firewall aan)

