extends Control

onready var game_scene = "res://Menus/GameMenu.tscn"
onready var book_scene = "res://Book/MainBook.tscn"


func _on_Play_Button_pressed() -> void:
	Global.goto_scene(game_scene)


func _on_Book_Button_pressed() -> void:
	Global.goto_scene(book_scene)


func _on_Social_Button_pressed() -> void:
	OS.shell_open("https://www.instagram.com/ronaldosenajr/?hl=pt-br")
