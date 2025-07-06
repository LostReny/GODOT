extends MeshInstance3D

@export var First_Name : String = "Liam"
@export var Last_Name : String = "Calice"
@export var Birth_Year : int = 2002

func _ready():
	
	#problem 01
	print("Your name is : " + First_Name + " " + Last_Name)
	
	#problem 02
	print("Your initials are : " + First_Name[0] + Last_Name[0])
	
	#problem 03
	print("The length of your full name is : " + str(First_Name.length() + Last_Name.length()))
	
	#problem 04
	randomize()
	var random_index = randi() % First_Name.length()
	var random_letter = First_Name[random_index]
	print("Here is a random number form your first name: "  + random_letter)
	
	
	#problem 05
	var today_year = 2025
	print("You were born in " + str(Birth_Year) + " witch means that you are " + str(today_year - Birth_Year) + " years old")
	
	#problem 06
	var days_year = 365
	var years_old = today_year - Birth_Year
	print("You have been alive for : " + str(years_old * days_year) + " days")
	pass
