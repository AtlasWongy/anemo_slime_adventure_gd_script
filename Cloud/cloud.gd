extends Node2D

func _enter_tree():

	var cloud_tween = create_tween()
	cloud_tween.tween_property(self, "position:x", rand_range(-1000, -1500), rand_range(10,20))
	
