extends Area2D
	
func _on_voidbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("players"):
		body.kill()
