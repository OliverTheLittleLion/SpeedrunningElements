extends CharacterBody2D

@export var damage: int = 1

func _ready():
    connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body):
    if body.is_in_group("Player"):
        body.take_damage(damage)
