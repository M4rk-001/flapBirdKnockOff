extends Node

@onready var plane = $"../AirPlane" as AirPlane
@onready var tower_spawner = $"../towerSpawner" as TowerSpawner
@onready var ground = $"../Ground" as Ground
@onready var UI = $"../Ui" as Ui

var points = 0

func _ready():
	plane.game_started.connect(on_game_started)
	ground.planeCrashed.connect(end_game)
	tower_spawner.plane_crashed.connect(end_game)
	tower_spawner.point_scored.connect(on_point_scored)
func on_game_started():
	tower_spawner.start_spawning_tower()
	
func end_game():
	ground.stop()
	plane.stop()
	tower_spawner.stop()
	UI.on_game_over()

func on_point_scored():
	points +=1
	print(points)
	UI.update_points(points)
