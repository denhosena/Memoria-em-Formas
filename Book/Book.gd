extends Control

onready var main_menu_scene = "res://Menus/Main Menu.tscn"

export(Array, PackedScene) onready var scenes

var loaded_pages = []
var index = 0

onready var position = $CenterContainer/VBoxContainer/PageContainer

func _ready():
	create_pages()
	pass

func _on_RightButton_pressed():
	var current_id = index
	if index < loaded_pages.size() -1:
		index += 1
	loaded_pages[current_id].hide()
	loaded_pages[index].show()



func _on_LeftButton_pressed():
	var current_id = index
	if index > 0:
		index -= 1
	loaded_pages[current_id].hide()
	loaded_pages[index].show()


func create_pages():
	var id = 0
	for i in scenes:
		id += 1
		var page = i.instance()
		position.add_child(page)
		loaded_pages.append(page)
		if (id > 1):
			page.hide()
	pass

func _on_back_to_main_menu_pressed() -> void:
	Global.goto_scene(main_menu_scene)
