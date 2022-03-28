#! /bin/bash

# It is specially made for all Pentesters,Network Engineers

echo "                   Process is going to be completed Shortly"
echo "              NOTE : Output is available at the end and also in a Pingip’s.txt"
echo "  "
# Get the octets from the network ip

ifconfig | grep "broadcast" | cut -d " " -f 10 | cut -d "." -f 1,2,3 | uniq > octet.txt

# set the variable to have the value of octet.txt

OCTET=$(cat octet.txt)

# Create new file .txt

echo "" > $OCTET.txt

# Loop

for ip in {1..254}

do
        ping -c 1 $OCTET.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d  ":" >> $OCTET.txt &
done


cat $OCTET.txt | sort > sorted_$OCTET.txt

echo "          There are Ping Mechain Ip Addresses"

cp sorted_$OCTET.txt pingip’s.txt

cat pingip’s.txt

rm -r octet.txt $OCTET.txt sorted_$OCTET.txt

exit
