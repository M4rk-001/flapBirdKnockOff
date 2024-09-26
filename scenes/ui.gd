extends CanvasLayer
class_name Ui
@onready var pointsLabel = $MarginContainer/PointsLabel
@onready var game_over_box = $MarginContainer/GameOverBox

func _ready():
	pointsLabel.text = "%d" % 0
func update_points(points: int):
	pointsLabel.text="%d" % points
	
func on_game_over():
	game_over_box.visible=true



func _on_button_pressed() :
	get_tree().reload_current_scene()
