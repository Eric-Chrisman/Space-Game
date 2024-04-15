extends Node2D

var state = 0 # 0 = loading; 1 = game ready; 2 = game active; 3 = player dead
var maps = [
	preload("res://Scenes/Game/Maps/testMap.tscn")
]
var preloadedPlayer = preload("res://Scenes/Game/Player/player.tscn")
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
