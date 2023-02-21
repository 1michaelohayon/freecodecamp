#!/bin/bash

if [[ -z $1 ]]; then
  echo "Please provide an element as an argument."
  exit 0
fi

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

arg1=$1

PARSE() {
response=$1
echo "$response" | cut -d '|' -f 1-9 | while IFS='|' read -r aNum symb name mass melt boil typeid typeid typ; do
  echo "The element with atomic number $aNum is $name ($symb). It's a $typ, with a mass of $mass amu. $name has a melting point of $melt celsius and a boiling point of $boil celsius."
done




}



if [[ $1 =~ ^([1-9]\d{0,2}|1000)$ ]]; then
  result=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) RIGHT JOIN types ON properties.type_id = types.type_id WHERE atomic_number = $1")
elif [[ $1 =~ ^[A-Z][a-z]*$ ]]; then
  result=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) RIGHT JOIN types ON properties.type_id = types.type_id WHERE name = '$1'") 
  if [[ -z $result && $1 =~ ^[A-Z][a-z]{0,1}$ ]]; then
    result=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) RIGHT JOIN types ON properties.type_id = types.type_id WHERE symbol = '$1'")
  fi
else 
  echo "I could not find that element in the database."
  exit 0
fi

PARSE $result

