extends MeshInstance3D

@export var age : int 

func _ready():
	#var is_adult : bool = age >= 18
	#print(is_adult)
	
	var complex_statement : bool = 5 < 10 && 5 != 5
	print(complex_statement)
	
	var complex_statement2 : bool = 5 < 10 || 5 != 5
	print(complex_statement2)
	pass

func _process(delta):
	pass
