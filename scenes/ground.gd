extends Node2D


class_name Ground

signal planeCrashed

@export var speed = -150
@onready var sprite1 = $Ground1/Sprite2D
@onready var sprite2 = $Ground2/Sprite2D

func _ready():
	sprite2.global_position.x = sprite1.global_position.x + sprite1.texture.get_width()

func _process(delta):
	sprite1.global_position.x += speed * delta
	sprite2.global_position.x += speed * delta

	# Se sprite1 saiu completamente da tela, mova para a direita de sprite2
	if sprite1.global_position.x < -sprite1.texture.get_width():
		sprite1.global_position.x = sprite2.global_position.x + sprite2.texture.get_width()

	# Se sprite2 saiu completamente da tela, mova para a direita de sprite1
	if sprite2.global_position.x < -sprite2.texture.get_width():
		sprite2.global_position.x = sprite1.global_position.x + sprite1.texture.get_width()

func _on_body_entered(body):
	planeCrashed.emit()
	stop()
	(body as AirPlane).stop()

func stop():
	speed=0
