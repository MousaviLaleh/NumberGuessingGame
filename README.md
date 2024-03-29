# Number Guessing Game

### Project Goal
Build a Number Guessing Game using PostgreSQL, Bash and Git. <br/>
This script 
  - *get input from user*,
  - *save data into database* and
  - *process the user activity based on the user's profile*
<br/>

Check the code here ... &nbsp; [number_guess.sh](number_guess.sh) <br/>

:copyright: [freeCodeCamp](https://www.freecodecamp.org/learn/relational-database/) Relational Database Course  <br/>

## Instructions
To complete this project, 
- you need to write a script that generates a random number between 1 and 1000 for users to guess. 
- Create a number_guess database to hold the information suggested in the user stories.
- Connect to the interactive psql shell with `psql --username=<database_username> --dbname=postgres` to create the database.
- In your script, you can create a `PSQL` variable for querying the database like this: <br/> `PSQL="psql --username=<database_username> --dbname=<database_name> -t --no-align -c"`.
- Your script should only ask for input from the user to get the username and to take guesses.
- Your script should output exactly what is described in the user storied below, and nothing extra.
- The tests will add users to your database when the script has that ability, feel free to delete those.
- Some script related user stories may not pass until the script is completely working. Don't forget to commit your work frequently.

Notes:
If you leave your virtual machine, your database may not be saved. You can make a dump of it by entering <br/> `pg_dump -cC --inserts -U <database_username> number_guess > number_guess.sql` <br/> in a bash terminal (not the psql one). It will save the commands to rebuild your database in `number_guess.sql`.  <br/>
The file will be located where the command was entered. If it's anything inside the project folder, the file will be saved in the VM. You can rebuild the database by entering `psql -U postgres < number_guess.sql` in a terminal where the .sql file is.


## Complete the tasks below

- Create a `number_guessing_game` folder in the project folder for your program
  ~~~
    mkdir number_guessing_game
    cd number_guessing_game
    git init
    git checkout -b main
    touch README.md 
    git add .
    git commit -m "Initial commit"
  ~~~

- Create `number_guess.sh` in your `number_guessing_game` folder and give it executable permissions
  ~~~
    touch number_guess.sh
    chmod +x number_guess.sh
    git add .
    git commit -m "feat: Create script file"
  ~~~

- Your script should have a shebang at the top of the file that uses #!/bin/bash

- Turn the `number_guessing_game` folder into a git repository

- Your git repository should have at least five commits

- Your script should randomly generate a number that users have to guess

- When you run your script, you should prompt the user for a username with Enter your username:, and take a username as input. Your database should allow usernames that are 22 characters

- If that username has been used before, it should print <br/>
  `Welcome back, <username>! You have played <games_played> games, and your best game took <best_game> guesses.`, <br/>
  with `<username>` being a users name from the database, `<games_played>` being the total number of games that user has played, and `<best_game>` being the fewest number of guesses it took that user to win the game

- If the username has not been used before, you should print <br/>
  `Welcome, <username>! It looks like this is your first time here`.

- The next line printed should be `Guess the secret number between 1 and 1000:` and input from the user should be read

- Until they guess the secret number, it should print `It's lower than that, guess again:` if the previous input was higher than the secret number, and
- `It's higher than that, guess again:` if the previous input was lower than the secret number. Asking for input each time until they input the secret number.

- If anything other than an integer is input as a guess, it should print   That is not an integer, guess again:  

- When the secret number is guessed, your script should print `You guessed it in <number_of_guesses> tries. The secret number was <secret_number>. Nice job!` and finish running

- The message for the first commit should be `Initial commit`

- The rest of the commit messages should start with `fix:`, `feat:`, `refactor:`, `chore:`, or `test:`

- You should finish your project while on the `main` branch, your working tree should be clean, and you should not have any uncommitted changes

  <br/>
