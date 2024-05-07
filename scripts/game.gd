extends Node2D

var score : int = 0
var score_text

func _ready():
	score_text = $CanvasLayer/ScoreText
	$GameMusic.play()
	spawn_mob()
	spawn_mob()
	spawn_mob()
	spawn_mob()
	spawn_mob()
	
func spawn_mob():
	print('mob spawned')
	var new_mob = preload("res://scenes/slime.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)


func _on_timer_timeout():
	spawn_mob()
	
func _on_score_timer_timeout():
	score = score + 1
	score_text.text = "Score: " + str(score)

func _on_player_health_depleted():
	$GameMusic.stop()
	$GameOver.visible = true
	$ScoreTimer.stop()
	#get_tree().paused = true
	if (score > Global.save_data.high_score):
		Global.save_data.high_score = score

func _on_game_over_button_pressed():
	get_tree().reload_current_scene()
	print('hello world')
	
func _on_back_to_menu_button_pressed():
	Global.save_data.save()
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


