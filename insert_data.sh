#! /bin/bash
PSQL="psql -U postgres -d pokemon_hm -c"

cat pokemon_hm.csv | while IFS="," read DEX NATL NAME TYPE CUT FLY SURF STRENGTH WATERFALL DIVE TOTAL
do
    #skip header values
    if [[ $DEX != "Dex #" && $NATL != "Nat'l #" && $NAME != "Name" && $TYPE != "Type" && $CUT != "Cut" && $FLY != "Fly" && $SURF != "Surf" && $STRENGTH != "Strength" && $WATERFALL != "Waterfall" && $DIVE != "Dive" && $TOTAL != "Total" ]]
    then
        INSERT_DATA=$($PSQL "INSERT INTO pokemon(dex, natl, name, type, cut, fly, surf, strength, waterfall, dive, total) VALUES('$DEX', '$NATL', '$NAME', '$TYPE', '$CUT', '$FLY', '$SURF', '$STRENGTH', '$WATERFALL', '$DIVE', $TOTAL);")
    fi
done