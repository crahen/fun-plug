#!/ffp/bin/bash

# Take a new snapshot of the modified fun_plug install.

cd /
FILE=fun_plug-mod-snapshot-$(/ffp/bin/date '+%Y%d%m%H').tar.gz
tar czvf \
  $HOME/$FILE \
  --exclude '*/.ssh' \
  --exclude '*/.git' \
  --exclude '*/.boto' \
  --exclude ffp/tmp \
  --exclude ffp/var/tmp \
  --exclude ffp/funpkg/cache \
  --exclude '*.sw[a-z0-9]' \
      ffp/*

cd $HOME
s3put -b crahen.net-fun-plug -k snapshots -p $HOME $HOME/$FILE
