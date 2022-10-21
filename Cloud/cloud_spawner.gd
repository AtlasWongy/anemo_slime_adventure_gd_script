extends Position2D

var cloud_one : = preload("res://Scenes/cloud_one_scene.tscn") as PackedScene
var cloud_two : = preload("res://Scenes/cloud_two_scene.tscn") as PackedScene
var cloud_array = []

func _ready():
	cloud_array = [cloud_one, cloud_two]
	cloud_instantiate()
	pass

func _process(_delta):
	if not is_instance_valid(cloud_array[0]):
		cloud_array[0].instance()
	else:
		print("It is already instanced")

func cloud_instantiate():

	for i in range(0, len(cloud_array), 1):
		cloud_array[i].instance()
		print("Instancing successful")

	pass




