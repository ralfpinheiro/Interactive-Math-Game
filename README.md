## State: Storing data describing themselves (variables)

Behavior: Defining actions that can be performed on them (methods)

class Players
-Two player
-Player - Current Player - Input/Output
-Lives State - Starts with 3
-Name
-Take_lives Behaviour - Subtracs 1
-Alive? Behaviour

class Game (App)
-Turns State
-Current_player State
-Players State
-Next_turn Behaviour
-AddPlayer Behaviour
-Increment_Score Behaviour
-Verify_answer Behaviour

class Question Input/Output
X State
Y State
Operation State

App I/O
Game State
HowManyPlayers Behaviour
AskForPlayerName Behaviour
PresentQuestion Behaviour
AskForAnswer Behaviour
DisplayFinalScore Behaviour
