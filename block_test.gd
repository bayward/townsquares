extends Node2D
@export var block_scene: PackedScene
var grid_size = 64  # adjust based on art
var placed_blocks = {} # to track placed blocks by grid
func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var mouse_pos = event.position
		var cell = Vector2(floor(mouse_pos.x / grid_size), floor(mouse_pos.y / grid_size))
		
		# Check if there's already a block
		if not placed_blocks.has(cell):
			var block_instance = block_scene.instantiate()
			block_instance.position = cell * grid_size
			add_child(block_instance)
			placed_blocks[cell] = block_instance
		else:
			print("Tile already placed here!")
