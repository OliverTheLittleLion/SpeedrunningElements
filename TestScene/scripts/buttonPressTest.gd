extends Sprite2D

@export var inputName : String = ""

func _process(_delta):
	if Input.is_action_pressed(inputName):
		print("player1 a pressed")
		self.visible = true
	else:
		self.visible = false
