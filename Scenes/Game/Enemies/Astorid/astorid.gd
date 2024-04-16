extends RigidBody2D
var started = true

# Called when the node enters the scene tree for the first time.
func _ready():
	angular_velocity = randf_range(1,5)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	updateTimer()

func _on_hit_box_area_entered(_area):
	$destory.play()
	visible = false
	set_collision_layer_value(1, false)
	set_collision_mask_value(1, false)
	$hitBox/CollisionShape2D.set_deferred("disabled", true)
	linear_velocity = Vector2(0,0)

func _on_destory_finished():
	queue_free()

func updateTimer():
	$Label.text = str(int($Timer.time_left))

func _on_timer_timeout():
	$hitBox/CollisionShape2D.set_deferred("disabled", false)
	$Label.visible = false
	$Polygon2D.visible = false
