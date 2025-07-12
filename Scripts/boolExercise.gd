extends MeshInstance3D

func _ready():
	
	#problem 1 = true
	print((5 % 2 == 1 && 10 > 10) || (5 * 5 == 10 || "hey" == "hey"))
	
	#problem 2 = false
	print(("hello".length() >= 5 && 3.5 > 3.45) && ("dragon".length() < 6 
	|| "a" == "A"))
	
	#problem 3 = true
	var name : String = "bob"
	var color : String = "blue"
	print((name.length() > color.length() || name[0] == color[0]) || 
	(name[2] == color[0] && 1 != 1))
	pass
