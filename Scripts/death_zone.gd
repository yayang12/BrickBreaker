extends Area2D

class_name DeathZone

signal life_lost
@onready var life_lost_sound = $LifeLostSound

func _on_body_entered(body):
	life_lost.emit()
	life_lost_sound.play()
