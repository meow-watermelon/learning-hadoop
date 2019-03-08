#!/bin/bash

set -e

echo "Syncing common configs..."
cat hosts | sed '/nfs/d' | xargs -I {} scp conf/{core-site.xml,dfs.exclude,dfs.include,racks.map} root@{}:/etc/hadoop

echo "Syncing nn1 config..."
scp conf/hdfs-site.xml.nn1 root@nn1.internal:/etc/hadoop/hdfs-site.xml
scp conf/hadoop-env.sh.nn root@nn1.internal:/etc/hadoop/hadoop-env.sh
scp conf/log4j.properties.nn root@nn1.internal:/etc/hadoop/log4j.properties

echo "Syncing nn2 config..."
scp conf/hdfs-site.xml.nn2 root@nn2.internal:/etc/hadoop/hdfs-site.xml
scp conf/hadoop-env.sh.nn root@nn2.internal:/etc/hadoop/hadoop-env.sh
scp conf/log4j.properties.nn root@nn2.internal:/etc/hadoop/log4j.properties

echo "Syncing datanode config..."
scp conf/hdfs-site.xml.client root@dn1.internal:/etc/hadoop/hdfs-site.xml
scp conf/hdfs-site.xml.client root@dn2.internal:/etc/hadoop/hdfs-site.xml
scp conf/hdfs-site.xml.client root@dn3.internal:/etc/hadoop/hdfs-site.xml
scp conf/hdfs-site.xml.client root@dn4.internal:/etc/hadoop/hdfs-site.xml
