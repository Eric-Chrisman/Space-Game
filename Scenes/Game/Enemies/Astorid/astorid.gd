extends RigidBody2D
var started = true

# Called when the node enters the scene tree for the first time.
func _ready():
	angular_velocity = randf_range(1,5)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	pass
