extends Control
class_name Card_to_book_sample

export(Resource) var card_resource

onready var profile_image = get_node("profile_image")
onready var card_name = get_node("card_name")
onready var card_description = get_node("card_description")


func _ready():
	set_data()
	pass

func set_data():
	profile_image.texture = card_resource.profile_image
	card_name.text = card_resource.card_name
	var description = card_resource.card_description
	card_description.append_bbcode(description)
	pass

func auto_scroll():
	var scroll_to = card_description.get_v_scroll()
	scroll_to.value = lerp(scroll_to.value, scroll_to.max_value, 0.02)
	print(scroll_to.value)
	

func _on_Timer_timeout():
	auto_scroll()
	$Timer.wait_time = 1;
	$Timer.start()
