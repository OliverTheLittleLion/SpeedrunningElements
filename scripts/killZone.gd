# KillZone.gd
extends Area2D

@export var target_groups: Array[String] = ["player1", "player2"]

func _ready():
    body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node):
    for group in target_groups:
        if body.is_in_group(group):
            if body.has_method("kill"):
                body.kill()
            else:
                body.queue_free()
            return  # Exit after handling first valid match
