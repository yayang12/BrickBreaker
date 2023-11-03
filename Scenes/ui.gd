extends CanvasLayer

class_name UI

@onready var lives_label = %LifesLabel
@onready var game_lost_container = $GameLostContainer

func set_lifes (lives:int):
	lives_label.text = "lives: %d" % lives

func game_over():
	game_lost_container.show()

func _on_game_lost_button_pressed():
	get_tree().reload_current_scene()
