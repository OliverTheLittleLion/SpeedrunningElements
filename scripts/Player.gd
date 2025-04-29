extends CharacterBody2D
@onready var sprite = $AnimatedSprite2D
var speed = 400
var jump_speed = -7500
var falling_speed = 0.125



func _process(delta):
	velocity = Vector2.ZERO  # Reset velocity each frame


    # Get input from the player
	if Input.is_action_pressed("p1_right"):
		velocity.x += 1
		sprite.flip_h = false
		velocity = velocity.normalized() * speed
	if Input.is_action_pressed("p1_left"):
		velocity.x -= 1
		sprite.flip_h = true
		velocity = velocity.normalized() * speed



	if not is_on_floor():
		velocity += get_gravity() * falling_speed
	if Input.is_action_just_pressed("p1_a") and is_on_floor():
		velocity.y = jump_speed
	



	if velocity.length() > 0:
		if sprite.animation != "move":
			sprite.play("move")
	else:
		if sprite.animation != "idle":
			sprite.play("idle")


	move_and_slide()
