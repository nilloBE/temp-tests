#!/usr/bin/env bash
# Read file line by line, and for each line use sed to pull out the SKU and name strings.
# Call loaddatastore.php to insert the data into datastore entities.
readarray -t LINES < "$1"
for LINE in "${LINES[@]}"; do
	sku=`echo $LINE | sed "s/^.\?{\"sku\":\([0-9]\+\),\"name\":\"\([^\"]\+\)\".*$/\1/g"`
	name=`echo $LINE | sed "s/^.\?{\"sku\":\([0-9]\+\),\"name\":\"\([^\"]\+\)\".*$/\2/g"`
	php loaddatastore.php "$sku" "$name"
done
