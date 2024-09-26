extends Node2D

class_name TwinTower
signal plane_entered
signal point_scored

var speed = 0

func set_speed(new_speed):
	speed = new_speed

func _process(delta):
	position.x += delta * speed

func _on_body_entered(body):
	plane_entered.emit()

func  _on_point_scored(body):
	point_scored.emit()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
