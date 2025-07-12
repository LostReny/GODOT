extends MeshInstance3D

@export var Name : String = "Isabelle"
@export var Weapon : String = "Sword"
@export var Health : int = 10
@export var Speed : float = 5.5
@export var enemyDamage : int = 2

func _ready():
	print("Welcome " + Name)
	print("the enemy found you and you are too slow to run away from him because your speed is only " + str(Speed))
	
	Health -= enemyDamage
	print("The enemy delt you " + str(enemyDamage) + " damage so you have got " + str(Health) + " health left")
	
	print("After much struggle, you were finally able to kill the enemy with your " + Weapon)
	
