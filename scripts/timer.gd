extends Node
@onready var timer = $Timer
@onready var label = $Label
var isTimerStarted = false
func _ready():
	timer.stop()

func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and !isTimerStarted:
		timer.start(900)
func _on_timer_timeout():

	pass # Replace with function body.