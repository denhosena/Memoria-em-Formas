extends Control

onready var main_menu_scene = "res://Menus/Main Menu.tscn"

onready var game_modes_menu = get_node("GameModes")
onready var easy_menu = get_node("Easy_LevelSelect")
onready var medium_menu = get_node("Medium_LevelSelect")
onready var hard_menu = get_node("Hard_LevelSelect")

func _ready() -> void:
	game_modes_menu.show()
	medium_menu.hide()
	hard_menu.hide()
	easy_menu.hide()

func _on_easy_Button_pressed() -> void:
	game_modes_menu.hide()
	medium_menu.hide()
	hard_menu.hide()
	easy_menu.show()

func _on_medium_Button_pressed() -> void:
	game_modes_menu.hide()
	medium_menu.show()
	hard_menu.hide()
	easy_menu.hide()

func _on_hard_Button_pressed() -> void:
	game_modes_menu.hide()
	medium_menu.hide()
	hard_menu.show()
	easy_menu.hide()


func _on_Back_Button_pressed() -> void:
	game_modes_menu.show()
	medium_menu.hide()
	hard_menu.hide()
	easy_menu.hide()


func _on_Back_To_Main_Menu_pressed() -> void:
	Global.goto_scene(main_menu_scene)
	pass # Replace with function body.
