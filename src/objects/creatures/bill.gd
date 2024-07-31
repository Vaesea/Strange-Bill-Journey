extends CharacterBody2D

const SPEED = 300.0 # The speed.
const RUNSPEED = 400.0 # The Run Speed
const MAX_JUMP_VELOCITY = -600.0 # Maximum Jump Velocity.

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Physics.
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		$Sprite0.texture = load("res://data/images/objects/creatures/player/bill/jumpsprite_2.png")
	else:
		# This stuff changes the sprite based on what key is being pressed, as long as Bill is on the floor! Floor! He likes to dance so give him more, more! Because here he is!
		#Bill, was meant to flyyyyy! Reach up, and touch the sky!!!!
		if Input.is_action_pressed("player_left") or Input.is_action_pressed("player_right"):
			$Sprite0.texture = load("res://data/images/objects/creatures/player/bill/sprite_2.png")
		else:
			$Sprite0.texture = load("res://data/images/objects/creatures/player/bill/sprite_0.png")
	
	if Input.is_action_pressed("player_left"):
		$Sprite0.flip_h = true
		
	if Input.is_action_pressed("player_right"):
		$Sprite0.flip_h = false

	# Handle jump.
	if Input.is_action_pressed("player_jump") and is_on_floor():
		velocity.y = MAX_JUMP_VELOCITY
		
	if Input.is_action_pressed("player_jump") and Input.is_action_pressed("player_attack_hold") and is_on_floor():
		velocity.y = MAX_JUMP_VELOCITY * 1.15

	# Get the input direction and handle the movement/deceleration.
	# Yes, Godot. I changed the actions to be player-specific actions stuff!!
	var direction = Input.get_axis("player_left", "player_right")
	if direction:
		if Input.is_action_pressed("player_attack_hold"):
			velocity.x = direction * RUNSPEED
		else:
			velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

# These are going to be the weirdest comments you've ever seen in a Godot script. I'm not sorry. 
# They are the lyrics to Starships by Nicki Minaj but Bill.
# Also you read source code? If you understand what's going on and you have a fix for this stuff that'd improve things, consider making a pull request!!!!!!!!!!!!!!!!!!!
# Let's gooooooooooooo!!!!!!!!!!!! Yeah!!!!!!!

# Uh, let's go to the beach-each
# Let's go get a wave
# They say what they gonna say
# Have a drink, clink, found the Powerful Circle (THIS IS A FUTURE POWER-UP)
# Bad squares like me is hard to come by
# The Patrón-ón? Let's go get it on
# The zone-one? Yes, I'm in the zone
# Is it two, three? Leave a good tip
# I'ma blow all of my lives and don't give two squares, uh
# I'm on the floor, floor
# I love to dance
# So give me more, more, 'til I can't stand
# Get on the floor, floor
# Like it's your last chance
# If you want more, more
# Then here I am
# Bill was meant to fly
# Weird hair up and touch the sky
# Can't stop 'cause we're so high
# Let's do this one more time, oh
# Bill was meant to fly
# Weird hair up and touch the sky
# Let's do this one last time
# Can't stop (we're higher than the Doz Castle)
# Jump in my hoopty, hoopty, hoop, I own that
# And I ain't paying my rent this month, I owe that
# But defeat who you want and defeat who you dislike
# Dancehall life, there's no end in sight
# Twinkle, twinkle, little Che
# Now everybody, let me hear you say ray, ray, ray
# Go spend all your money 'cause today payday
# And if you're a shape you a shape shape shape
# My name is Bill so just call me Bill (woo)
# Get on the floor, floor
# Like it's your last chance
# If you want more, more
# Then here I am
# Bill was meant to fly
# Weird hair up and touch the sky
# Can't stop 'cause we're so high
# Let's do this one more time, oh
# Bill was meant to fly
# Weird hair up and touch the sky
# Let's do this one last time
# Can't stop (we're higher than the Doz Castle)
# Bill was meant to fly
# Weird hair up and touch the sky
# Can't stop 'cause we're so high
# Let's do this one more time, oh
# Bill was meant to fly
# Weird hair up and touch the sky
# Let's do this one last time
# Can't stop (we're higher than the Doz Castle)

# As I said, I'm not sorry.
# Or maybe I am.
# I'm not sure, unfortunately.
