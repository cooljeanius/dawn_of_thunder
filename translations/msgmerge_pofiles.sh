#!/bin/sh

# First, run wmlxgettext from your wesnoth tools directory like this:
# ./wmlxgettext --domain=wesnoth-Dawn_of_Thunder --directory=/Users/ericgallager/Library/Containers/org.wesnoth.Wesnoth/Data/Library/Application\ Support/Wesnoth_1.18/data/add-ons/dawn_of_thunder --recursive --warnall -o /Users/ericgallager/Library/Containers/org.wesnoth.Wesnoth/Data/Library/Application\ Support/Wesnoth_1.18/data/add-ons/dawn_of_thunder/translations/Dawn_of_Thunder.pot
# (with edits to correct paths as necessary)

for mylang in ja; do
	msgmerge --previous --update --lang=${mylang} wesnoth-Dawn_of_Thunder/${mylang}.po Dawn_of_Thunder.pot;
	msgfmt -o wesnoth-Dawn_of_Thunder/${mylang}.mo wesnoth-Dawn_of_Thunder/${mylang}.po;
done
if test -e ~/Downloads/Dawn_of_Thunder_old.pot; then
	diff -u ~/Downloads/Dawn_of_Thunder_old.pot Dawn_of_Thunder.pot > Dawn_of_Thunder.pot.diff
fi
