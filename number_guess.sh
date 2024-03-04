#!/bin/bash

# PSQL="psql -X -h localhost -p 54321 -U postgres --dbname=number_guess -t --no-align -c"
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo -e "\n~~ Guess the Number ~~\n"
echo -e "\nEnter your username:"
read USERNAME
# make UPPERCASE the first latter of name
# USERNAME=${USERNAME^}

# get user data
USER_INFO=$($PSQL "SELECT player_name FROM players WHERE player_name='$USERNAME'")

# if it's new player
if [[ -z $USER_INFO ]]
then
    # get new player's name
    echo -e "Welcome, $USERNAME! It looks like this is your first time here."
    # add new player to database
    INSERT_PLAYER=$($PSQL "INSERT INTO players(player_name) VALUES('$USERNAME')")

# if not new
else
    GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM games INNER JOIN players USING(player_id) WHERE player_name='$USERNAME'")
    BEST_GAME=$($PSQL "SELECT MIN(number_of_guess) FROM games INNER JOIN players USING(player_id) WHERE player_name='$USERNAME'")
    echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# generate random number
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
echo $SECRET_NUMBER

# guess counter
NUMBER_OF_GUESSES=0

# ask player to guess
echo -e "\nGuess the secret number between 1 and 1000:"
read USER_GUESS

until [[ $USER_GUESS == $SECRET_NUMBER ]]
do
    # check the validity
    if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
    then
        echo -e "\nThat is not an integer, guess again:"
        read USER_GUESS
        ((NUMBER_OF_GUESSES++))

    else
        if [[ $USER_GUESS > $SECRET_NUMBER ]]
        then
            echo "It's higher than that, guess again:"
            read USER_GUESS
            ((NUMBER_OF_GUESSES++))
        else
            echo "It's lower than that, guess again:"
            read USER_GUESS
            ((NUMBER_OF_GUESSES++))
        fi
    fi
done

# apply user last guess
((NUMBER_OF_GUESSES++))

# get user id
PLAYER_ID=$($PSQL "SELECT player_id FROM players WHERE player_name='$USERNAME'")
# add result to game history/database
INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(player_id, number_of_guess, random_number) VALUES($PLAYER_ID, $NUMBER_OF_GUESSES, $SECRET_NUMBER)")

# winning message
echo -e "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"