extends RigidBody2D

var power = 300
@onready var flame = $flameHitBox
var flameDistanceFromPlayer = 120
var state = 1
var playThrusterSound = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if state == 1:
		var movement = Vector2(0,0)
		var finalPower = 0
		if (Input.is_action_pressed("w")):
			movement.y = -1
		elif (Input.is_action_pressed("s")):
			movement.y = 1
		if (Input.is_action_pressed("a")):
			movement.x = -1
		elif (Input.is_action_pressed("d")):
			movement.x = 1
		movement = movement.normalized()
		finalPower = movement * power * delta
		apply_central_impulse(finalPower)
		if finalPower == Vector2(0, 0):
			hideFlame()
		else:
			showFlame(movement)
		
		if (Input.is_action_pressed("space")):
			linear_damp = 0.5
		else:
			linear_damp = 0

func hideFlame():
	flame.visible = false
	stopThrusterSound()
	$flameHitBox/CollisionShape2D.set_deferred("disabled", true)

func showFlame(directionVector):
	flame.visible = true
	flame.position = -1 * directionVector * flameDistanceFromPlayer
	flame.rotation = directionVector.angle() - (PI/2)
	$flameHitBox/CollisionShape2D.set_deferred("disabled", false)
	startThrusterSound()

func _on_player_hit_box_area_entered(_area):
	visible = false
	set_collision_layer_value(1, false)
	set_collision_mask_value(1, false)
	$playerHitBox/CollisionShape2D.set_deferred("disabled", true)
	linear_velocity = Vector2(0,0)
	state = 2
	$death.play()
	hideFlame()

func stopThrusterSound():
	playThrusterSound = false
	$thruster.stop()

func startThrusterSound():
	if !playThrusterSound:
		playThrusterSound = true
		$thruster.play()

func _on_thruster_finished():
	if playThrusterSound:
		$thruster.play()
