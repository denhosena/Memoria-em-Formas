extends MarginContainer

export(Resource) var card_data

onready var profile_image = get_node("VBoxContainer/ImageAndNameContainer/TextureRect")
onready var name_text = get_node("VBoxContainer/ImageAndNameContainer/data")

onready var description_text = get_node("VBoxContainer/DescriptionContainer/PanelContainer/data")



func _ready():
	Set_Data()
	pass

func Set_Data():
	profile_image.texture = card_data.profile_image
	name_text.text = card_data.card_name
	description_text.bbcode_text = card_data.card_description
	
	pass