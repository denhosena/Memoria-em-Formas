extends Spatial

signal level_completed()


func _ready():
	pass


func _on_Goal_body_entered(body):
	if body.is_in_group("Player"):
		emit_signal("level_completed")
