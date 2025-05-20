# Enemy.gd
extends CharacterBody2D

@export var speed : float = 100.0
@export var respawn_time : float = 3.0  # Time before respawning after being destroyed
@export var damage_on_hit : int = 1  # How much damage the player takes when hit

var spawn_position : Vector2

func _ready():
    spawn_position = position
    set_process(true)

# Enemy fall behavior
func _process(delta):
    # The enemy falls straight down
    velocity.y = speed
    move_and_slide()

# Called when the enemy collides with the player or is destroyed
func kill():
    hide()  # Hide the enemy
    set_process(false)  # Stop the enemy from moving
    $CollisionShape2D.disabled = true  # Disable collision detection

    # Respawn after a delay
    respawn()

# Respawn enemy back to its original position (now with async)
func respawn():
    # Wait for the timer to finish (using a Timer to handle the delay)
    await get_tree().create_timer(respawn_time).timeout

    # Respawn logic
    position = spawn_position
    show()  # Make the enemy visible again
    set_process(true)  # Start processing again
    $CollisionShape2D.disabled = false  # Re-enable collision detection
