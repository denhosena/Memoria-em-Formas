extends Control

signal retried

onready var time = $CenterContainer/Column/Time

func initialize(total_play_time):
	var minutes = str(int(total_play_time /60.0))
	var seconds = str(int(fmod(total_play_time, 60.0)))
	var time_text = "Total Time: %s m %s s" % [minutes, seconds]
	time.text = time_text
	
	show()

func _on_TryAgain_pressed():
	emit_signal("retried")

func _on_Exit_pressed():
	get_tree().quit()
