extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# setting the z-index of every object to their y-position ...
	for child in get_children():
		# ... at least if they have a z-index
		if child is Node2D:			
			child.z_index = child.position.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
