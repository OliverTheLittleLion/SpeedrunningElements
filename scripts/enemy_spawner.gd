# EnemySpawner.gd
extends Node2D

@export var enemy_scene : PackedScene  # The enemy scene to spawn
@export var spawn_rate : float = 1.0   # Spawn rate (how often enemies spawn in seconds)
@export var spawn_area : Rect2 = Rect2(0, 0, 800, 600)  # Define spawn area (width, height)

func _ready():
    # Start the spawning logic
    set_process(true)  # Enable _process() to run every frame

# This function spawns an enemy at a random position
func spawn_enemy():
    # Instantiate the enemy scene
    var enemy_instance = enemy_scene.instantiate()
    
    # Generate a random position within the spawn area (X and Y)
    var random_x = randf_range(spawn_area.position.x, spawn_area.position.x + spawn_area.size.x)
    var random_y = randf_range(spawn_area.position.y, spawn_area.position.y + spawn_area.size.y)
    
    # Set the random position of the enemy
    enemy_instance.position = Vector2(random_x, random_y)

    # Add the enemy instance to the scene
    add_child(enemy_instance)

# This function is called every frame to periodically spawn enemies
func _process(delta):
    # Spawn an enemy randomly based on the spawn rate
    if randf() < spawn_rate * delta:
        spawn_enemy()
