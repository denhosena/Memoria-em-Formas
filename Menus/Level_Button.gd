extends Control

export (int) var level
export (String) var level_to_load
export (bool) var enabled

onready var button = get_node("Button")


func _ready():
	setup()


func setup():
	button.text= str(level)

func _on_Button_pressed() -> void:
	Global.goto_scene(level_to_load)
