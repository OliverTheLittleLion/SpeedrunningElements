extends Node2D

@export var game_duration : int = 11  # Game duration in seconds (adjustable in the editor)

var remaining_time : int
var game_timer : Timer
var timer_label : Label  # Reference to the Label node

func _ready():
	game_timer = $GameTimer  # Reference the Timer node.
	timer_label = $TimerLabel  # Reference the Label node.
	remaining_time = game_duration  # Set remaining time to game duration.
	game_timer.start(game_duration)

# This function will be called when the timer finishes.
func _on_timer_timeout():
	print("Time's up! Game over!")
	game_timer.stop()  # Stop the timer when it ends.
	timer_label.text = "Game Over!"  # Display "Game Over" on the label.
	
	
	# Handle game over logic here, such as ending the game or restarting.

# Update the timer display every frame.
func _process(delta):
	if remaining_time > 0:
		remaining_time = int(game_timer.time_left)  # Get the remaining time in seconds.
		# Update the label text with the remaining time.
		timer_label.text = "Time remaining: %d seconds" % remaining_time
	else:
		print("Game over!")