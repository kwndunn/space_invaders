extends KinematicBody2D

export (PackedScene) var Bullet

# func _process(delta):
var velocity : Vector2 = Vector2()

func shoot():
	var b = PlayerWeapon.instance()
	add_child(b)
	#b.transform = $Muzzle.transform

func _physics_process(delta):
	velocity = Vector2()
	
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_just_pressed("ui_accept"):
		shoot()
		# fire!
		
	velocity = velocity.normalized()
	velocity = move_and_slide(velocity * 200)
