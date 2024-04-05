extends Node3D


var time: float = 0

func _process(delta):
	time += delta
	
	$Camera3D.position = Vector3(cos(time*0.1)*5, 3, sin(time*0.1)*5)
	$Camera3D.look_at(Vector3(0,0,0))
