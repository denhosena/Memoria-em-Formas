extends Control
class_name Card_to_book_sample

export(Resource) var card_resource

onready var profile_image = get_node("profile_image")
onready var card_name = get_node("card_name")
onready var card_description = get_node("card_description")

var toggle
var can_scroll = true

func _ready():
	set_data()
	pass

func _process(delta):
	if (toggle):
		auto_scroll(delta)
	pass

func set_data():
	profile_image.texture = card_resource.profile_image
	card_name.text = card_resource.card_name
	var description = card_resource.card_description
	card_description.append_bbcode(description)
	pass

func auto_scroll(delta):
	var scroll = card_description.get_v_scroll()
	var scroll_value = 0.5
	scroll.value += scroll_value



func _on_CheckButton_toggled(button_pressed):
	toggle = button_pressed
	pass # Replace with function body.
