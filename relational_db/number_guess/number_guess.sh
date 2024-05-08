#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

NAME=$($PSQL "SELECT username FROM users WHERE username='$USERNAME'")

if [[ -z $NAME ]]
then
  # if username has not been used
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
else
  # if username has been used
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$NAME'")
  GAMES=$($PSQL "SELECT COUNT(game_id) FROM users FULL JOIN games USING(user_id) WHERE user_id=$USER_ID")
  BEST_GAME=$($PSQL "SELECT MIN(number_of_guesses) FROM users FULL JOIN games USING(user_id) WHERE user_id=$USER_ID")
  if [[ -z $BEST_GAME ]]
  then
    BEST_GAME=0
  fi
  echo "Welcome back, $NAME! You have played $GAMES games, and your best game took $BEST_GAME guesses."
fi

echo -e "\nGuess the secret number between 1 and 1000:"
read GUESS
SECRET_NUMBER=$[ $RANDOM % 1000 + 1 ]
TRIES=1

while [[ $GUESS != $SECRET_NUMBER ]]
do
  # if guess is not a number
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    read GUESS
  # if guess is lower
  else if [[ $GUESS > $SECRET_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
      ((TRIES++))
      read GUESS
    # if guess is higher
    else
      echo "It's higher than that, guess again:"
      ((TRIES++))
      read GUESS
    fi
  fi
done

# when secret number is guessed
WINNER=$($PSQL "SELECT * FROM users WHERE username='$USERNAME'")
echo "$WINNER" | while IFS='|' read USERNAME USER_ID
do
  INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(number_of_guesses, user_id) VALUES($TRIES, $USER_ID)")
  echo "You guessed it in $TRIES tries. The secret number was $SECRET_NUMBER. Nice job!"
done