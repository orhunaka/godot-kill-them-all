extends Node2D

var high_score_text

func _ready():
	high_score_text = $CanvasLayer/Background/HighestScoreText
	var high_score : int = Global.save_data.high_score
	high_score_text.text = "High Score: " + str(high_score)

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_exit_button_pressed():
	get_tree().quit()
