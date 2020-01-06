extends Node2D
class_name ShowCardSpriteLarge

onready var sprite1 = $Sprite
onready var sprite2 = $Sprite2

func _ready():
	hide()
	pass


func Set_Sprites(var spr1, var spr2):
	sprite1.texture = spr1
	sprite2.texture = spr2

func Show_Card_Sprites():
	show()
	$Timer.wait_time = 1
	$Timer.start()

func Hide_Card_Sprite():
	hide()

func _on_Timer_timeout():
	Hide_Card_Sprite()
