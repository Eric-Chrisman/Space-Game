extends Node2D

var state = 0 # 0 = loading; 1 = game ready; 2 = game active; 3 = player dead
var maps = [
	preload("res://Scenes/Game/Maps/testMap.tscn")
]
var preloadedPlayer = preload("res://Scenes/Game/Player/player.tscn")
var preloadedAstroid = preload("res://Scenes/Game/Enemies/Astorid/astorid.tscn")
var astroidRespwanTime = 4
var astroidList = []
var loadedMap
var player

# Called when the node enters the scene tree for the first time.
func _ready():
	loadMap()
	loadPlayer()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func loadMap():
	loadedMap = maps[0].instantiate()
	add_child(loadedMap)

func loadPlayer():
	player = preloadedPlayer.instantiate()
	add_child(player)

func _on_respwan_astoid_timer_timeout():
	spwanAstroid()

func spwanAstroid():
	var astroid = preloadedAstroid.instantiate()
	astroid.position = Vector2(randi_range(-500,500), randi_range(-500,500))
	astroid.linear_velocity = Vector2(randf_range(-5, 5), randf_range(-5, 5)) * 10
	add_child(astroid)
	astroidList.append(astroid)
