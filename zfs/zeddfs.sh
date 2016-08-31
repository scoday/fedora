[root@scoday01 ~]# zpool create -d -o feature@async_destroy=enabled -o feature@empty_bpobj=enabled -o feature@lz4_compress=enabled -o ashift=12 -O compression=lz4 rpool /dev/sda3
[root@scoday01 ~]# zpool export rpool
[root@scoday01 ~]# zpool import rpool
[root@scoday01 ~]# zpool status -v rpool
  pool: rpool
 state: ONLINE
status: Some supported features are not enabled on the pool. The pool can
	still be used, but some features are unavailable.
action: Enable all features using 'zpool upgrade'. Once this is done,
	the pool may no longer be accessible by software that does not support
	the features. See zpool-features(5) for details.
  scan: none requested
config:

	NAME        STATE     READ WRITE CKSUM
	rpool       ONLINE       0     0     0
	  sda3      ONLINE       0     0     0

errors: No known data errors
[root@scoday01 ~]# udevadm trigger
[root@scoday01 ~]# zfs create rpool/ROOT/boot
[root@scoday01 ~]# zfs create rpool/ROOT/fedora
[root@scoday01 ~]# zfs create rpool/ROOT/var
[root@scoday01 ~]# zfs create rpool/ROOT/home
[root@scoday01 ~]# zfs list
NAME                USED  AVAIL  REFER  MOUNTPOINT
rpool              1.81M   157G   156K  /rpool
rpool/ROOT          740K   157G   196K  /rpool/ROOT
rpool/ROOT/boot     136K   157G   136K  /rpool/ROOT/boot
rpool/ROOT/fedora   136K   157G   136K  /rpool/ROOT/fedora
rpool/ROOT/home     136K   157G   136K  /rpool/ROOT/home
rpool/ROOT/var      136K   157G   136K  /rpool/ROOT/var


