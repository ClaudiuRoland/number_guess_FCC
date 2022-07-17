#!/bin/bash
#connection to the database
PSQL="psql --username=freecodecamp --dbname=number_guess --tuples-only -c"

#generate random number
SECRET_NUMBER=$( echo $[ $RANDOM % 1000 +1 ] )
#ask for user name
echo -e "\nEnter your username:"
read USER_NAME
USER_DB=$($PSQL "select * from users where user_name='$USER_NAME'")
if [[ -z $USER_DB ]]
  then
    echo "Welcome, $USER_NAME! It looks like this is your first time here."
    GAMES_PLAYED=0
    BEST_GAME=0
    INSERT_USER=$($PSQL "insert into users(user_name,games,best_game) values('$USER_NAME',$GAMES_PLAYED,'$BEST_GAME')")  
  else 
    USER=$(echo $($PSQL "select user_name from users where user_name='$USER_NAME'") | sed 's/ //g')
    GAMES_PLAYED=$(echo $($PSQL "select games from users where user_name='$USER_NAME'") | sed 's/ //g')
    BEST_GAME=$(echo $($PSQL "select best_game from users where user_name='$USER_NAME'") | sed 's/ //g')
    echo "Welcome back, $USER! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."                      
fi

echo -e "\nGuess the secret number between 1 and 1000:"
GUESS=0

until [[ $NUMBER -eq $SECRET_NUMBER ]]
do
read NUMBER
#if number guessed
if [[ ! $NUMBER =~ ^[0-9]+$ ]]
then
  echo -e "\nThat is not an integer, guess again:"
  (( GUESS++ ))
else
  if [[ $NUMBER -eq $SECRET_NUMBER ]]
    then
      (( GUESS++ ))
      echo "You guessed it in $GUESS tries. The secret number was $SECRET_NUMBER. Nice job!"
      if [[ $BEST_GAME -gt $GUESS || $BEST_GAME -eq 0 ]]
        then
          BEST_GAME=$GUESS
      fi    
      GAMES_PLAYED=$(( GAMES_PLAYED + 1 ))
      RESULT=$($PSQL "update users set best_game=$BEST_GAME where user_name='$USER_NAME'")
      GAMES_RESULT=$($PSQL "update users set games=$GAMES_PLAYED where user_name='$USER_NAME'")
      
    else
      #if number lower
      if [[ $NUMBER -lt $SECRET_NUMBER ]]
        then
          echo -e "\nIt's higher than that, guess again:"
          (( GUESS++ ))
      fi
      #if number upper
      if [[ $NUMBER -gt $SECRET_NUMBER ]]
        then
          echo -e "\nIt's lower than that, guess again:"
          (( GUESS++ ))
      fi
  fi
fi  
done

