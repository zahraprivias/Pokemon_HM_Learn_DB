#!/bin/bash
PSQL="psql -U postgres -d pokemon_hm -t --no-align -c"

MAIN_MENU() {
    echo -e "\n~~~~~ Pokemon Black/White HM List ~~~~~\n"
    echo "Welcome, you can search for HM moves a Pokemon can learn here."
    echo "Search for Pokemon:"
    read NAME_INPUT

    #get pokemon data
    POKEMON_NAME=$($PSQL "SELECT name, cut, fly, surf, strength, waterfall, dive FROM pokemon WHERE name ILIKE '$NAME_INPUT'")

    #if pokemon is not available
    if [[ -z $POKEMON_NAME ]]
    then
        echo "We don't have any Pokemon with that name."
    else
        RESULT "$NAME_INPUT"
    fi
}

RESULT() {
    #get HM moves data
    SEARCH_POKEMON=$($PSQL "SELECT name, 
        CASE WHEN cut = 'Y' THEN 'Cut' ELSE NULL END AS cut_hm, 
        CASE WHEN fly = 'Y' THEN 'Fly' ELSE NULL END AS fly_hm, 
        CASE WHEN surf = 'Y' THEN 'Surf' ELSE NULL END AS surf_hm, 
        CASE WHEN strength = 'Y' THEN 'Strength' ELSE NULL END AS strength_hm, 
        CASE WHEN waterfall = 'Y' THEN 'Waterfall' ELSE NULL END AS waterfall_hm, 
        CASE WHEN dive = 'Y' THEN 'Dive' ELSE NULL END AS dive_hm 
        FROM pokemon WHERE name ILIKE '$1';")  #$1 is input

    echo "$SEARCH_POKEMON" | while IFS='|' read -r NAME cut_hm fly_hm surf_hm strength_hm waterfall_hm dive_hm 
    do
        #array for multiple HM moves
        HM_MOVES=()

        #check HM moves that can be learned
        [[ ! -z $cut_hm ]] && HM_MOVES+=("$cut_hm")
        [[ ! -z $fly_hm ]] && HM_MOVES+=("$fly_hm")
        [[ ! -z $surf_hm ]] && HM_MOVES+=("$surf_hm")
        [[ ! -z $strength_hm ]] && HM_MOVES+=("$strength_hm")
        [[ ! -z $waterfall_hm ]] && HM_MOVES+=("$waterfall_hm")
        [[ ! -z $dive_hm ]] && HM_MOVES+=("$dive_hm")

        HM_OUTPUT=$(IFS=', '; echo "${HM_MOVES[*]}")
        if [[ -n $HM_OUTPUT ]]
        then
            echo "$NAME can learn $HM_OUTPUT."
        else
            echo "$NAME cannot learn any HM."
        fi
    done
}

MAIN_MENU