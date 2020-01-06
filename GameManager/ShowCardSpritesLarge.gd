extends Node2D
class_name ShowCardSpriteLarge

onready var sprite1 = $Sprite
onready var sprite2 = $Sprite2
onready var animator = $AnimationPlayer

func _ready():
	self.modulate = 0
	pass


func Set_Sprites(var spr1, var spr2):
	sprite1.texture = spr1
	sprite2.texture = spr2

func Show_Card_Sprites():
	animator.play("FadeIn")


func Hide_Card_Sprite():
	animator.play("FadeOut")

func _on_Button_pressed():
	if animator.current_animation == "FadeIn":
		var pos = animator.current_animation_length
		animator.advance(pos)
	if animator.current_animation == "FadeOut":
		var pos = animator.current_animation_length
		animator.advance(pos)
	if animator.current_animation == "Idle":
		Hide_Card_Sprite()


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "FadeIn":
		animator.play("Idle")
	if anim_name == "Idle":
		Hide_Card_Sprite()
