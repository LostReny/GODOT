extends Area2D

@export var coin_points = 0

# quero que a moeda seja coletada quando o player colidir
# com o player, e que ela seja deletada

func _on_body_entered(body: Node2D) -> void:
	print("+1 coin")
	queue_free()
	pass # Replace with function body.
