extends Control


var elapsed_time := 0.0

@onready var time_label: Label = $TimeLabel

func _ready():
	# Start the stopwatch automatically
	set_process(true)

func _process(delta: float) -> void:
	elapsed_time += delta
	_update_time_label()

func _update_time_label():
	var minutes = int(elapsed_time) / 60
	var seconds = int(elapsed_time) % 60
	var milliseconds = int((elapsed_time - int(elapsed_time)) * 100)
	time_label.text = "%02d:%02d.%02d" % [minutes, seconds, milliseconds]
