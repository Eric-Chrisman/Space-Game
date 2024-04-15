extends RigidBody2D

var power = 300
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var movement = Vector2(0,0)
	if (Input.is_action_pressed("w")):
		movement.y = -1
	elif (Input.is_action_pressed("s")):
		movement.y = 1
	if (Input.is_action_pressed("a")):
		movement.x = -1
	elif (Input.is_action_pressed("d")):
		movement.x = 1
	apply_central_impulse(movement * power * delta)
	
	if (Input.is_action_pressed("space")):
		linear_damp = 0.5
	else:
		linear_damp = 0
