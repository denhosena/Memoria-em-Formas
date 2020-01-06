extends Node2D

class_name CardManager

export(Array, Texture) var cardsSprites

onready var card = load("res://Card/Card.tscn")

var positions = []
var randomNumbers = []


func _ready():
	randomize()
	GetPositions()
	GenerateRandomNumbers()
	InstantiateCard()

func GenerateRandomNumbers():
	while randomNumbers.size() < positions.size():
		var i = randi() % cardsSprites.size()
		if !randomNumbers.has(i):
			randomNumbers.append(i)
			randomNumbers.append(i)
	randomNumbers.shuffle()

func GetPositions():
	for i in get_child_count():
		positions.append(get_child(i))
	positions.shuffle()
	pass

func InstantiateCard():
	for i in positions.size():
		var cards = card.instance()
		SetFaceCards(cards, i)
		positions[i].add_child(cards)
		pass


func SetFaceCards(var cardi, var id):
	cardi.SetFrontCard(cardsSprites[randomNumbers[id]], randomNumbers[id])
