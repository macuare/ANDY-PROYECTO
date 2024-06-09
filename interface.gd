extends Control

func _on_boton_play_mouse_entered():
	$Click.play(0.0)


func _on_boton_play_button_down():
	$Click.play(0.0)
	get_tree().change_scene_to_file("res://mundo.tscn")
