extends Area2D

# quero que a moeda seja coletada quando o player colidir
# com a moeda.

func _on_body_entered(body: Node2D) -> void:
	queue_free()
	pass # Replace with function body.
