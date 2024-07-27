extends CharacterBody2D


const SPEED = 300.0 # The speed.
const RUNSPEED = 400.0 # The Run Speed
const JUMP_VELOCITY = -600.0 # Jump velocity.

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Physics.
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		$Sprite0.texture = load("res://data/images/objects/creatures/player/bill/jumpsprite_2.png")
	
	if Input.is_action_pressed("player_left"):
		$Sprite0.flip_h = true
		
	if Input.is_action_pressed("player_right"):
		$Sprite0.flip_h = false

	# Handle jump.
	if Input.is_action_pressed("player_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if is_on_floor():
		$Sprite0.texture = load("res://data/images/objects/creatures/player/bill/sprite_0.png")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions. This has already been done.
	var direction = Input.get_axis("player_left", "player_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
