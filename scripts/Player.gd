extends CharacterBody2D
@onready var sprite = $AnimatedSprite2D
# Player Movement
var speed = 200
func _ready():
	sprite.play("idle")

func _process(delta):
	velocity = Vector2.ZERO  # Reset velocity each frame

    # Get input from the player
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1

	velocity = velocity.normalized() * speed

	position += velocity * delta

	if velocity.length() > 0:
		if sprite.animation != "move":
			sprite.play("move")
	else:
		if sprite.animation != "idle":
			sprite.play("idle")

	move_and_slide()