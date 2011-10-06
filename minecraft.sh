#!/bin/sh
me=`whoami`
wget https://raw.github.com/theovlit/Craft-Bukkit-Installer-Linux/master/minecraft
sudo mv minecraft /etc/init.d/minecraft
chmod 755 /etc/init.d/minecraft
update-rc.d minecraft defaults
sudo ln -s /etc/init.d/minecraft /bin/mc
mkdir worldstorage
wget http://ci.bukkit.org/job/dev-CraftBukkit/promotion/latest/Recommended/artifact/target/craftbukkit-0.0.1-SNAPSHOT.jar
BINDIR="$(dirname "$(readlink -fn "$0")")"
cd "$BINDIR"
java -Xincgc -Xmx1G -jar ~/minecraft/craftbukkit-0.0.1-SNAPSHOT.jar
mv /home/$me/minecraft/world /home/$me/minecraft/worldstorage
mv /home/$me/minecraft/world_nether /home/$me/minecraft/worldstorage
rm /home/$me/minecraft/server.log
rm /home/$me/minecraft/minecraft.sh

