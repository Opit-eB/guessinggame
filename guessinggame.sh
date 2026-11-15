#!/bin/bash
# guessinggame.sh - guess how many files are in the current directory

function count_files {
    ls | wc -l | tr -d ' '
}

actual=$(count_files)
guess=-1

echo "Welcome to the Guessing Game!"
echo "How many files are in the current directory?"

while [[ $guess -ne $actual ]]
do
    read -p "Enter your guess: " guess

    if [[ ! $guess =~ ^[0-9]+$ ]]
    then
        echo "Please enter a valid number."
        guess=-1
    elif [[ $guess -lt $actual ]]
    then
        echo "Too low! Try again."
    elif [[ $guess -gt $actual ]]
    then
        echo "Too high! Try again."
    else
        echo "Congratulations! You guessed correctly."
    fi
done
