extends Node

class_name TowerSpawner

signal plane_crashed
signal point_scored

var twin_tower_scene = preload("res://scenes/tower.tscn")
var started=false
@export var tower_speed = -150

@onready var spawn_time = $Timer

func _ready():
	spawn_time.timeout.connect(spawn_tower)
func start_spawning_tower():
	spawn_time.start()

func spawn_tower():
	var tower = twin_tower_scene.instantiate() as TwinTower
	add_child(tower)
	
	var viewport_rect = get_viewport().get_camera_2d().get_viewport_rect()
	var half_height = viewport_rect.size.y/2
	tower.position.x = viewport_rect.end.x
	tower.position.y = randf_range(viewport_rect.size.y * 0.15 - half_height,viewport_rect.size.y * 0.65 - half_height)
	tower.plane_entered.connect(on_plane_entered)
	tower.point_scored.connect(on_point_scored)
	tower.set_speed(tower_speed)

func on_plane_entered():
	plane_crashed.emit()
	stop()

func stop():
	spawn_time.stop()
	for tower in get_children().filter(func (child): return child is TwinTower):
		(tower as TwinTower).speed=0


func on_point_scored():
	point_scored.emit()
