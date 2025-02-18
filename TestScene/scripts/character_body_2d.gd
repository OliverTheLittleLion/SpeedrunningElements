extends CharacterBody2D

const SPEED = 600.0
@onready var sprite : AnimatedSprite2D = $AnimatedSprite2D
@export var playerId : int = 0

func _physics_process(_delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()

	var hDirection = Input.get_axis("p%s_left" % playerId, "p%s_right" % playerId)
	if hDirection:
		velocity.x = hDirection * SPEED
		if hDirection < 0:
			sprite.play("left")
		else:
			sprite.play("right")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)


	var vDirection = Input.get_axis("p%s_up" % playerId, "p%s_down" % playerId)
	if vDirection:
		velocity.y = vDirection * SPEED
		if vDirection < 0:
			sprite.play("up")
		else:
			sprite.play("down")
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
