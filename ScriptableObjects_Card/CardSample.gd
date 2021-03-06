extends Control
class_name Card_to_book_sample

export(Resource) var card_resource
onready var card_texture = get_node("card_sprite")
onready var card_description = get_node("card_description")

var auto_scroll = false

func _ready():
	set_data()
	pass

func _process(delta):
	if auto_scroll:
		Auto_scroll(delta)
	pass

func set_data():
	card_texture.texture = card_resource.card_texture
	var description = card_resource.card_description
	card_description.append_bbcode(description)
	pass

func Auto_scroll(delta):
	var scroll_to = card_description.get_v_scroll()
	if (scroll_to.value == 0):
		yield(get_tree().create_timer(0.5),"timeout")
	scroll_to.value += 30 * delta

func _on_CheckBox_toggled(button_pressed):
	auto_scroll = button_pressed
	pass # Replace with function body.
