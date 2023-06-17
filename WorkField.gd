extends Node2D
var work_height = 0
var work_width = 0
var cell_size = 0
var cur_lab_part = {'in':0,'out':0, 'blocks':[], 'coins':[]}
var full_lab_part = {'coins':[],"blocks":[{"colour":"blue","x":9,"y":19},{"colour":"blue","x":8,"y":19},{"colour":"blue","x":7,"y":19},{"colour":"blue","x":6,"y":19},{"colour":"blue","x":5,"y":19},{"colour":"red","x":4,"y":19},{"colour":"red","x":3,"y":19},{"colour":"red","x":2,"y":19},{"colour":"red","x":1,"y":19},{"colour":"red","x":0,"y":19},{"colour":"red","x":0,"y":18},{"colour":"red","x":1,"y":18},{"colour":"red","x":2,"y":18},{"colour":"red","x":3,"y":18},{"colour":"red","x":4,"y":18},{"colour":"blue","x":5,"y":18},{"colour":"blue","x":6,"y":18},{"colour":"blue","x":7,"y":18},{"colour":"blue","x":8,"y":18},{"colour":"blue","x":9,"y":18},{"colour":"blue","x":9,"y":17},{"colour":"blue","x":8,"y":17},{"colour":"blue","x":7,"y":17},{"colour":"blue","x":6,"y":17},{"colour":"blue","x":5,"y":17},{"colour":"red","x":4,"y":17},{"colour":"red","x":3,"y":17},{"colour":"red","x":2,"y":17},{"colour":"red","x":1,"y":17},{"colour":"red","x":0,"y":17},{"colour":"red","x":1,"y":16},{"colour":"red","x":2,"y":16},{"colour":"red","x":3,"y":16},{"colour":"red","x":4,"y":16},{"colour":"blue","x":5,"y":16},{"colour":"blue","x":6,"y":16},{"colour":"blue","x":7,"y":16},{"colour":"blue","x":8,"y":16},{"colour":"blue","x":9,"y":16},{"colour":"red","x":0,"y":16},{"colour":"red","x":0,"y":15},{"colour":"red","x":1,"y":15},{"colour":"red","x":2,"y":15},{"colour":"red","x":3,"y":15},{"colour":"red","x":4,"y":15},{"colour":"blue","x":5,"y":15},{"colour":"blue","x":6,"y":15},{"colour":"blue","x":7,"y":15},{"colour":"blue","x":8,"y":15},{"colour":"blue","x":9,"y":15},{"colour":"blue","x":9,"y":14},{"colour":"blue","x":8,"y":14},{"colour":"blue","x":8,"y":13},{"colour":"blue","x":7,"y":13},{"colour":"blue","x":6,"y":13},{"colour":"blue","x":5,"y":13},{"colour":"red","x":4,"y":14},{"colour":"red","x":3,"y":14},{"colour":"red","x":2,"y":14},{"colour":"red","x":1,"y":14},{"colour":"red","x":0,"y":14},{"colour":"blue","x":5,"y":14},{"colour":"blue","x":6,"y":14},{"colour":"blue","x":7,"y":14},{"colour":"blue","x":9,"y":13},{"colour":"red","x":4,"y":13},{"colour":"red","x":3,"y":13},{"colour":"red","x":2,"y":13},{"colour":"red","x":1,"y":13},{"colour":"red","x":0,"y":13},{"colour":"red","x":0,"y":12},{"colour":"red","x":1,"y":12},{"colour":"red","x":2,"y":12},{"colour":"red","x":3,"y":12},{"colour":"red","x":4,"y":12},{"colour":"blue","x":5,"y":12},{"colour":"blue","x":6,"y":12},{"colour":"blue","x":7,"y":12},{"colour":"blue","x":8,"y":12},{"colour":"blue","x":9,"y":12},{"colour":"blue","x":9,"y":11},{"colour":"blue","x":8,"y":11},{"colour":"blue","x":7,"y":11},{"colour":"blue","x":6,"y":11},{"colour":"blue","x":5,"y":11},{"colour":"red","x":4,"y":11},{"colour":"red","x":3,"y":11},{"colour":"red","x":2,"y":11},{"colour":"red","x":1,"y":11},{"colour":"red","x":0,"y":11},{"colour":"red","x":0,"y":10},{"colour":"red","x":1,"y":10},{"colour":"red","x":2,"y":10},{"colour":"red","x":3,"y":10},{"colour":"red","x":4,"y":10},{"colour":"blue","x":5,"y":10},{"colour":"blue","x":6,"y":10},{"colour":"blue","x":7,"y":10},{"colour":"blue","x":8,"y":10},{"colour":"blue","x":9,"y":10},{"colour":"blue","x":9,"y":9},{"colour":"blue","x":8,"y":9},{"colour":"blue","x":7,"y":9},{"colour":"blue","x":6,"y":9},{"colour":"blue","x":5,"y":9},{"colour":"red","x":4,"y":9},{"colour":"red","x":3,"y":9},{"colour":"red","x":2,"y":9},{"colour":"red","x":1,"y":9},{"colour":"red","x":0,"y":9},{"colour":"red","x":0,"y":8},{"colour":"red","x":0,"y":7},{"colour":"red","x":1,"y":7},{"colour":"red","x":2,"y":7},{"colour":"red","x":3,"y":7},{"colour":"red","x":4,"y":7},{"colour":"blue","x":5,"y":7},{"colour":"blue","x":6,"y":8},{"colour":"blue","x":7,"y":8},{"colour":"blue","x":8,"y":8},{"colour":"blue","x":9,"y":8},{"colour":"blue","x":5,"y":8},{"colour":"red","x":4,"y":8},{"colour":"red","x":3,"y":8},{"colour":"red","x":2,"y":8},{"colour":"red","x":1,"y":8},{"colour":"blue","x":6,"y":7},{"colour":"blue","x":7,"y":7},{"colour":"blue","x":8,"y":7},{"colour":"blue","x":9,"y":7},{"colour":"blue","x":9,"y":6},{"colour":"blue","x":8,"y":6},{"colour":"blue","x":7,"y":6},{"colour":"blue","x":6,"y":6},{"colour":"blue","x":5,"y":6},{"colour":"red","x":4,"y":6},{"colour":"red","x":3,"y":6},{"colour":"red","x":2,"y":6},{"colour":"red","x":1,"y":6},{"colour":"red","x":0,"y":6},{"colour":"red","x":0,"y":5},{"colour":"red","x":1,"y":5},{"colour":"red","x":2,"y":5},{"colour":"red","x":3,"y":5},{"colour":"red","x":4,"y":5},{"colour":"blue","x":5,"y":5},{"colour":"blue","x":6,"y":5},{"colour":"blue","x":7,"y":5},{"colour":"blue","x":8,"y":5},{"colour":"blue","x":9,"y":5},{"colour":"blue","x":8,"y":4},{"colour":"blue","x":7,"y":4},{"colour":"blue","x":6,"y":4},{"colour":"blue","x":5,"y":4},{"colour":"red","x":4,"y":4},{"colour":"red","x":3,"y":4},{"colour":"red","x":2,"y":4},{"colour":"red","x":1,"y":4},{"colour":"red","x":0,"y":4},{"colour":"blue","x":9,"y":4},{"colour":"blue","x":9,"y":3},{"colour":"blue","x":8,"y":3},{"colour":"blue","x":7,"y":3},{"colour":"blue","x":6,"y":3},{"colour":"blue","x":5,"y":3},{"colour":"red","x":4,"y":3},{"colour":"red","x":3,"y":3},{"colour":"red","x":2,"y":3},{"colour":"red","x":1,"y":3},{"colour":"red","x":0,"y":3},{"colour":"red","x":0,"y":2},{"colour":"red","x":1,"y":2},{"colour":"red","x":2,"y":2},{"colour":"blue","x":7,"y":2},{"colour":"blue","x":8,"y":2},{"colour":"blue","x":9,"y":2},{"colour":"blue","x":6,"y":2},{"colour":"blue","x":5,"y":2},{"colour":"red","x":4,"y":2},{"colour":"red","x":3,"y":2},{"colour":"red","x":1,"y":1},{"colour":"red","x":0,"y":1},{"colour":"red","x":2,"y":1},{"colour":"red","x":3,"y":1},{"colour":"red","x":4,"y":1},{"colour":"blue","x":5,"y":1},{"colour":"blue","x":6,"y":1},{"colour":"blue","x":7,"y":1},{"colour":"blue","x":8,"y":1},{"colour":"blue","x":9,"y":1},{"colour":"blue","x":9,"y":0},{"colour":"blue","x":8,"y":0},{"colour":"blue","x":7,"y":0},{"colour":"blue","x":6,"y":0},{"colour":"blue","x":5,"y":0},{"colour":"red","x":4,"y":0},{"colour":"red","x":3,"y":0},{"colour":"red","x":2,"y":0},{"colour":"red","x":1,"y":0},{"colour":"red","x":0,"y":0}],"in":3,"out":3}
var selected_colour = 'auto'
@onready var BlueBox = preload("res://blue_box.tscn")
@onready var RedBox = preload("res://red_box.tscn")
@onready var Coin = preload("res://coin.tscn")
var last_path = 'results/lab01.json'

# Called when the node enters the scene tree for the first time.
func _ready():
	$FileDialog.current_path = last_path
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
	
func create_coin(pos):
	var target_bb_size = cell_size
	var bb = Coin.instantiate()
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
	var hud_size = 185
	var calc_w = get_viewport().get_visible_rect().size.x-hud_size
	var calc_h = get_viewport().get_visible_rect().size.y
	
	if calc_h > calc_w *2:
		work_width = get_viewport().get_visible_rect().size.x-hud_size
		cell_size = work_width/10
		work_height = cell_size*20
	else:
		work_height = calc_h
		cell_size = work_height/20
		work_width = cell_size * 10
		
	$ColorRect.size.y = work_height
	$ColorRect.size.x = work_width
	for i in range (10):
		draw_line(Vector2(cell_size*i, 0), Vector2(cell_size*i, cell_size*20), Color.BLACK, 1.0)
	for i in range (21):
		draw_line(Vector2(0, cell_size*i), Vector2(work_width, cell_size*i), Color.BLACK, 1.0)
		
	delete_blocks()
	add_blocks()
	add_coins()
	$HUD.position.y = 0
	$HUD.position.x = work_width
	$HUD.size.y = work_height
	$HUD.size.x = get_viewport().get_visible_rect().size.x - work_width
	print("draw")
	
	
func is_block_exist(x:int,y:int):
	var result = false
	for i in cur_lab_part['blocks']:
		if i['x'] == x and i['y'] == y:
			result = i
	for i in cur_lab_part['coins']:
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
		
func add_coins():
	for b in cur_lab_part['coins']:
		create_coin(Vector2(b['y'], b['x']))
		
		
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
				if selected_colour == 'coin':
					var new_block = {'x':click_x, 'y':click_y}
					cur_lab_part['coins'].append(new_block)
					print ('add_coin')
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
				cur_lab_part['coins'].erase(is_block_exist(click_x, click_y))
			else:
				pass
				#print ('not_exist')
			#print (cur_lab_part)
		#print(event.as_text())
		_draw()


func _on_clear_pressed():
	cur_lab_part['blocks']=[]
	cur_lab_part['coins']=[]
	_draw()
	pass # Replace with function body.


func _on_colour_item_selected(index):
	if index == 0:
		selected_colour = 'blue'
	elif index == 1:
		selected_colour = 'red'
	elif index == 2:
		selected_colour = 'auto'
	elif index == 3:
		selected_colour = 'coin'
	pass # Replace with function body.


func _on_save_pressed():
	$FileDialog.current_path = last_path
	$FileDialog.show()
	pass # Replace with function body.


func save_lab_part(path):
	cur_lab_part['in'] = int($HUD/BoxContainer/InBox/In.text)
	cur_lab_part['out'] = int($HUD/BoxContainer/OutBox/Out.text)
	var file = FileAccess.open(path, FileAccess.WRITE)
	var content = JSON.stringify(cur_lab_part)
	file.store_string(content)
	file.close()
	last_path = path

func _on_file_dialog_file_selected(path):
#	var file = File.new()
#	file.open(path, File.WRITE)
#	file.store_var(thing_to_save)
#	file.close()
	#last_path = path
	#print(path)
	save_lab_part(path)
	pass # Replace with function body.


func _on_fill_pressed():
	print('fill')
	print(full_lab_part)
	cur_lab_part['blocks'] = []
	cur_lab_part['coins'] = []
	for b in full_lab_part['blocks']:
		cur_lab_part['blocks'].append(b)
	#var new_full_lab_part = full_lab_part
	#cur_lab_part = full_lab_part
	_draw()
	pass # Replace with function body.


func _on_load_pressed():
	print('loading')
	$LoadFileDialog.current_path = last_path
	$LoadFileDialog.show()

	pass # Replace with function body.


func _on_load_file_dialog_file_selected(path):
	cur_lab_part['blocks'] = []
	cur_lab_part['coins'] = []
	#var lab_part_random_file_name = lab_parts_file_list[randi() % lab_parts_file_list.size()]
	print('loading ', path)
	last_path = path
	var lab_part_file = FileAccess.open(path, FileAccess.READ)
	var json_string = lab_part_file.get_line()
	var json_object = JSON.new()
	json_object.parse(json_string)
	var loaded_lab_part = json_object.get_data()
	if 'blocks' in loaded_lab_part:
		cur_lab_part['blocks'] = loaded_lab_part['blocks']
		
	if 'coins' in loaded_lab_part:
		cur_lab_part['coins'] = loaded_lab_part['coins']
	
	print (loaded_lab_part)
	if 'in' in loaded_lab_part:
		$HUD/BoxContainer/InBox/In.text = str(loaded_lab_part['in'])
		
	if 'out' in loaded_lab_part:
		$HUD/BoxContainer/OutBox/Out.text = str(loaded_lab_part['out'])
	
	_draw()
	#print('loading ',lab_part_random_file_name)
	#return json_object.get_data()
	
	pass # Replace with function body.
