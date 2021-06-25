# README

API about the game rock, paper, scissor.

Initialisation : 

* Copy this repository to your github and then to your computer.

* Don't forget to lauch to your terminal rails db:create then rails db:migrate to create your data base locally ( the game is style in devellopement, so you have to test it locally)

* use in your terminal bundle install, to install the gem used for this game.

* And finally in a terminal use rails s, to launch a server (localhost//3000) to lauch the app in local. 

How to test it :

* you cand run rspec to see if the test created worked.

* you can used postman as i was, to test the differents request and see the right body

Postman :

* INDEX :
use a GET request with no body to this address : http://localhost:3000/api/v1/games

it will return in the body all the games (there is no games yet in your loacl data base, you have to play first to have games.)

* CREATE :
use a POST request with a body like {"name":  "Ponky", "move": "rock"} to this address : http://localhost:3000/api/v1/games

it will return the SHOW of the games that at been created with the result. the body will be likes this :
{
  "moves": [
    {
      "name": "Ponky",
      "move": "rock"
    },
    {
      "name": "Bot",
      "move": "scissor"
    }
  ],
  "result": "Ponky wins"
} 