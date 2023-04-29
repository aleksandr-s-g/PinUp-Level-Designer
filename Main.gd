extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().get_root().connect("size_changed", resized)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_item_rect_changed():
	#print("size changed")
	pass # Replace with function body.
	
func resized():
	pass
	#print("size changed to ", get_viewport().get_visible_rect().size)
	
