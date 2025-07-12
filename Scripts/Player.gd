extends MeshInstance3D

#variaveis 
var curso : String = "Godot"
var nome_jogador : String = "LostWordls"

var jogador2 : String = "Yuri"
var pontos : int = 100


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(nome_jogador)
	curso = "Godot 4"
	print(curso)
	print("Jogador: ", jogador2)
	print("Pontos: ", pontos)

