extends Node2D
class_name Card

onready var spriteNode = $Sprite
onready var animationNode = $AnimationPlayer
onready var timer = $Timer

var cardManager
var gameManager

export var id : int 

var canflip : bool = true

var spriteFrontCard : Texture 
export(Texture) var spriteBackCard : Texture


func _ready():
	spriteNode.texture = spriteBackCard
	cardManager = get_parent().get_parent()
	gameManager = cardManager.get_parent().get_node("GameManager")
	canflip = true


func SetFrontCard(sprite : Texture, i : int):
	spriteFrontCard = sprite
	id = i


func _on_Button_pressed():
	if (canflip):
		Flip_Card()


func Flip_Card():
	if (canflip and gameManager.canFlipCards):
		gameManager.Add_Cards_To_Compare(self)
		animationNode.play("FlipAnimation")
		timer.wait_time = 0.25
		timer.start()
		yield(timer, "timeout")
		spriteNode.texture = spriteFrontCard
		canflip = false

func Unflip_Card():
	gameManager.Remove_From_Cards_To_Compare(self)
	animationNode.play("FlipAnimation")
	timer.wait_time = 0.25
	timer.start()
	yield(timer, "timeout")
	spriteNode.texture = spriteBackCard
	canflip = true
	pass

func Destroy_Card():
	gameManager.Remove_From_Cards_To_Compare(self)
	queue_free()
