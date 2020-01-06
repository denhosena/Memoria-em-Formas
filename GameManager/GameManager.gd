extends Node2D
class_name GameManager

onready var timer = $Timer
onready var cardManager
onready var showCardSprite : ShowCardSpriteLarge


var maxNumberOfCardsFlipped = 2
var cardsFlipped = 0
var maxNumberOfMatchs : int
var canFlipCards = true

var cardsToCompare = []

func _ready():
	cardManager = get_parent().get_node("CardManager")
	showCardSprite = get_parent().get_node("ShowCardSpritesLarge")
	maxNumberOfMatchs = cardManager.positions.size() / 2

func _process(delta):
	cardsFlipped = cardsToCompare.size()
	if cardsFlipped < maxNumberOfCardsFlipped:
		canFlipCards = true
	else:
		canFlipCards = false
		Check_Cards()
	if maxNumberOfMatchs <= 0:
		get_tree().reload_current_scene()

func Add_Cards_To_Compare(card : Card):
	if cardsFlipped < maxNumberOfCardsFlipped:
		cardsToCompare.append(card)


func Remove_From_Cards_To_Compare(card : Card):
	if cardsToCompare.size() != 0:
		cardsToCompare.erase(card)

func Check_Cards():
	var i = cardsToCompare[0]
	var j = cardsToCompare[1]
	showCardSprite.Set_Sprites(i.spriteFrontCard, j.spriteFrontCard)
	if i.id == j.id:
		canFlipCards = false
		if timer.is_stopped():
			timer.wait_time = 1
			timer.start()
			yield(timer, "timeout")
			Cards_Match()
	else:
		canFlipCards = false
		if (timer.is_stopped()):
			timer.wait_time = 1
			timer.start()
			yield(timer, "timeout")
			False_Check()
	pass

func Cards_Match():
	showCardSprite.Show_Card_Sprites()
	for i in cardsToCompare.size():
		cardsToCompare[0].Destroy_Card()
	maxNumberOfMatchs -= 1


func False_Check():
	for i in cardsToCompare.size():
		cardsToCompare[0].Unflip_Card()

