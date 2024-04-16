extends Node2D
# Main will handle maps and ui and main logic
# Called when the node enters the scene tree for the first time.]

var preloadedGame = preload("res://Scenes/Game/GameEni/game.tscn")
var preloadedTitle = preload("res://Scenes/Title/title.tscn")
var title
var game
var state# 0 for title; 1 for game
var wait = false

func _ready():
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	state = 0
	title = preloadedTitle.instantiate()
	add_child(title)
	title.setMain(self)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if state == 0 and Input.is_action_just_pressed("esc") and wait:
		get_tree().quit()
	elif state == 1 and Input.is_action_just_pressed("esc"):
		load_game_to_title()
	wait = true

# unloads title to load game
func load_title_to_game():
	title.queue_free()
	game = preloadedGame.instantiate()
	add_child(game)
	state = 1

# unloads game to load title
func load_game_to_title():
	game.queue_free()
	title = preloadedTitle.instantiate()
	title.setMain(self)
	add_child(title)
	state = 0
