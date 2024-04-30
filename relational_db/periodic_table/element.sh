#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ ! $1 ]]
then
  # if no argument is provided
  echo "Please provide an element as an argument."
  else
  # if argument is atomic_number
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    ELEMENT=$($PSQL "SELECT * FROM properties FULL JOIN elements USING(atomic_number) FULL JOIN types USING(type_id) WHERE atomic_number=$1")
    # if element not found
    if [[ -z $ELEMENT ]]
    then
      echo "I could not find that element in the database."
    # element found
    else
      echo "$ELEMENT" | while IFS='|' read  TYPE_ID ATOMIC_NUMBER MASS MELTING_POINT BOILING_POINT SYMBOL NAME TYPE
      do
        echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
      done
    fi
  # if argument is symbol
  else if [[ $1 =~ ^[A-Z][a-z]?$ ]]
    then
      ARG=$1
      CAPITAL_NAME="${ARG^}"
      ELEMENT=$($PSQL "SELECT * FROM properties FULL JOIN elements USING(atomic_number) FULL JOIN types USING(type_id) WHERE symbol='$CAPITAL_NAME'")
      # if element not found
      if [[ -z $ELEMENT ]]
      then
        echo "I could not find that element in the database."
      # element found
      else
        echo "$ELEMENT" | while IFS='|' read  TYPE_ID ATOMIC_NUMBER MASS MELTING_POINT BOILING_POINT SYMBOL NAME TYPE
        do
          echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
        done
      fi
    #if argument is name
    else if [[ $1 =~ [a-zA-Z]*$ ]]
      then
        # Capitalize first letter for query
        ARG=$1
        CAPITAL_NAME="${ARG^}"
        ELEMENT=$($PSQL "SELECT * FROM properties FULL JOIN elements USING(atomic_number) FULL JOIN types USING(type_id) WHERE name='$CAPITAL_NAME'")
        # if element not found
        if [[ -z $ELEMENT ]]
        then
          echo "I could not find that element in the database."
        # element found
        else
          echo "$ELEMENT" | while IFS='|' read  TYPE_ID ATOMIC_NUMBER MASS MELTING_POINT BOILING_POINT SYMBOL NAME TYPE
          do
            echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
          done
        fi
      fi
    fi
  fi
fi