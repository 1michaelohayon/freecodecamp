#!/bin/bash
#pg_dump -cC --inserts -U freecodecamp number_guess > number_guess.sql

readonly PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:";
read username_input

username=$($PSQL "SELECT username FROM users WHERE username = '$username_input'")

if [[ -z $username ]]; then
  insert_user_result=$($PSQL "INSERT INTO users(username) VALUES('$username_input')")
  username=$($PSQL "SELECT username FROM users WHERE username = '$username_input'")
  
  echo "Welcome, $username! It looks like this is your first time here."
  
else 
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$username'")
  games_played=$($PSQL "SELECT count(*) FROM games WHERE user_id = $USER_ID")
  best_game=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id = $USER_ID AND win = true")
  echo "Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses."
  win=true
fi

echo "Guess the secret number between 1 and 1000:"


#initialize game
CLEAN_ABANDONED_GAMES=$($PSQL "UPDATE games SET guesses = -1 WHERE guesses = 0")
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$username'")
CREATE_NEW_GAME_RESULT=$($PSQL "INSERT INTO games(user_id) VALUES($USER_ID)")
GAME_ID=$($PSQL "SELECT game_id FROM games WHERE user_id = '$USER_ID' AND guesses = 0")
readonly number=$(($RANDOM % 1000 + 1))
win=false
guesses=0 

Try () {
  guesses=$(($guesses + 1))
  if [[ $1 -lt $number ]]; then
    echo "It's higher than that, guess again:"
    
  elif [[ $1 -gt $number ]]; then
    echo "It's lower than that, guess again:"
  else
    WIN_RESULT=$($PSQL "UPDATE games SET win = true WHERE game_id = $GAME_ID")
    echo "You guessed it in $guesses tries. The secret number was $number. Nice job!"
    win=true
  fi
}


while [[ $win = false ]];
do
  read input
  if ! [[ $input =~  ^-?[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
  else 
    Try $input
  fi
done
INSERT_RESULT=$($PSQL "UPDATE games SET guesses = $guesses WHERE game_id = $GAME_ID")


