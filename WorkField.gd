extends Node2D
var work_height = 0
var work_width = 0
var cell_size = 0
var cur_lab_part = {'in':0,'out':0, 'blocks':[]}
var selected_colour = 'auto'
@onready var BlueBox = preload("res://blue_box.tscn")
@onready var RedBox = preload("res://red_box.tscn")
var last_path = ''

# Called when the node enters the scene tree for the first time.
func _ready():
	$FileDialog.current_path = 'results/lab01.json'
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print("size ", get_viewport().get_visible_rect().size)

	pass
	
func create_block(pos, colour):
	var target_bb_size = cell_size
	var bb
	if colour == 'red':
		bb = RedBox.instantiate()
	elif colour == 'blue':
		bb = BlueBox.instantiate()
	else:
		print(colour, ' IS WRONG COLOUR!')
	#var bb = BlueBox.instantiate()
	#var bb = RedBox.instantiate()
	var bb_size = bb.get_node('Sprite2D').get_rect().size.x
	var s = target_bb_size/bb_size
	bb.scale = Vector2(s,s)
	var r_mob_size = target_bb_size
	var poz_y = work_height - r_mob_size*(pos.x+1)
	#var mob_size = get_viewport().get_visible_rect().size.y/10
	var pos_x = pos.y*target_bb_size
	bb.position = Vector2(pos_x,poz_y)
	add_child(bb)

func _draw():
	work_width = get_viewport().get_visible_rect().size.x*0.8
	cell_size = work_width/10
	work_height = cell_size*20
	$ColorRect.size.y = work_height
	$ColorRect.size.x = work_width
	for i in range (10):
		draw_line(Vector2(cell_size*i, 0), Vector2(cell_size*i, cell_size*20), Color.BLACK, 1.0)
	for i in range (21):
		draw_line(Vector2(0, cell_size*i), Vector2(work_width, cell_size*i), Color.BLACK, 1.0)
		
	delete_blocks()
	add_blocks()
	$HUD.position.y = 0
	$HUD.position.x = work_width
	$HUD.size.y = work_height
	$HUD.size.x = get_viewport().get_visible_rect().size.x - work_width
	#print("draw")
	
	
func is_block_exist(x:int,y:int):
	var result = false
	for i in cur_lab_part['blocks']:
		if i['x'] == x and i['y'] == y:
			result = i
	return result

func delete_blocks():
	if get_child_count() > 0:
		var children = get_children()
		for c in children:
			#print (c)
			if c is StaticBody2D:
				#rint ('==')
				remove_child(c)
				c.queue_free()
				
func add_blocks():
	for b in cur_lab_part['blocks']:
		create_block(Vector2(b['y'], b['x']), b['colour'])
		
		
func _input(event):
   # Mouse in viewport coordinates.
	#print(event)
	#if event is InputEventMouseMotion and event.get_pressure() > 0.1:
		#print(event)
		#print(event.get_pressure(), event.position, event.get_button_mask())
	if (event is InputEventMouseButton and event.is_pressed()) or (event is InputEventMouseMotion and event.get_pressure() > 0.1):#event.pressure > 0.1: #
		if event.position.x>work_width or event.position.y > work_height:
			return
		var click_x = int(event.position.x*10/work_width)
		var click_y = 19-int(event.position.y*20/work_height)
		#print("Mouse Click at: ", event.position, click_x," ", click_y)
		if event.as_text() == 'Left Mouse Button' or event.get_button_mask() == 1:
			#print("Left Mouse Click at: ", event.position, click_x," ", click_y)
			if is_block_exist(click_x, click_y):
				pass
				#print ('already_exist')
			else:
				var colour_to_draw = ''
				if selected_colour == 'auto':
					if click_x<5:
						colour_to_draw = 'red'
					else:
						colour_to_draw = 'blue'
				else:
					colour_to_draw = selected_colour
				var new_block = {'colour':colour_to_draw, 'x':click_x, 'y':click_y}
				cur_lab_part['blocks'].append(new_block)
				#create_block(Vector2(click_y, click_x), 'red')
			#print (cur_lab_part)
		if event.as_text() == 'Right Mouse Button'or event.get_button_mask() == 2:
			#print("Right Mouse Click at: ", event.position, click_x," ", click_y)
			delete_blocks()
			if is_block_exist(click_x, click_y):
				cur_lab_part['blocks'].erase(is_block_exist(click_x, click_y))
			else:
				pass
				#print ('not_exist')
			#print (cur_lab_part)
		#print(event.as_text())
		_draw()


func _on_clear_pressed():
	cur_lab_part['blocks']=[]
	_draw()
	pass # Replace with function body.


func _on_colour_item_selected(index):
	if index == 0:
		selected_colour = 'blue'
	elif index == 1:
		selected_colour = 'red'
	elif index == 2:
		selected_colour = 'auto'
	pass # Replace with function body.


func _on_save_pressed():
	$FileDialog.show()
	pass # Replace with function body.


func save_lab_part(path):
	cur_lab_part['in'] = int($HUD/In.text)
	cur_lab_part['out'] = int($HUD/Out.text)
	var file = FileAccess.open(path, FileAccess.WRITE)
	var content = JSON.stringify(cur_lab_part)
	file.store_string(content)
	file.close()

func _on_file_dialog_file_selected(path):
#	var file = File.new()
#	file.open(path, File.WRITE)
#	file.store_var(thing_to_save)
#	file.close()
	#last_path = path
	#print(path)
	save_lab_part(path)
	pass # Replace with function body.
