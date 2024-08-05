class_name PlayerWalkState
extends PlayerState

# Movement State

const WALKSPEED := 325.0

var MoveSpeed
var playerdir : float

func EnterState():
	parent.sprite.play("Run")
	MoveSpeed = WALKSPEED

func ExitState():
	parent.velocity.x = 0

func Physics_Update(_delta: float):
	playerdir = Input.get_axis("move_left","move_right")
	
	if playerdir < 0:
		parent.sprite.flip_h = true
	elif playerdir > 0:
		parent.sprite.flip_h = false
	
	parent.velocity.x = playerdir * MoveSpeed
	
	CheckStairCase()
	CheckAirborne()
	CheckStateConditions()

# There's probably a better way to write this all instead of a bunch of different functions,
# buuut this is my way. hehehe. ~Obli.

# Check if the next tile is climbable.
func CheckStairCase():	
	# Raycasts for the Stairclimbing function
	var raycastcollider = parent.raycast_collider
	var raycastabove = parent.raycast_above
	var collisionpoint = parent.raycast_collider.get_collision_point()

		

	raycastcollider.target_position = Vector2((playerdir * 100),2)
	raycastcollider.force_raycast_update()
	
	if raycastcollider.is_colliding():
		# Configure raycastabove to check above.
		raycastabove.target_position = Vector2((playerdir * 125),-4)
		raycastabove.force_raycast_update()
		
		# If there is a way up, move the player up so they can keep moving.
		if not raycastabove.is_colliding():
			parent.position.y -= 32
			parent.position.x += playerdir * 2 # This is just to make it feel smoother going up the stairs.
		

# If the player is in the air while they're walking then play the jump animation.
func CheckAirborne():
	if !parent.is_on_floor() and !parent.raycast_above.is_colliding():
		parent.sprite.play("Jump")
	else:
		parent.sprite.play("Run")

# Check the many different things the player could do while moving.	
func CheckStateConditions():
	if playerdir == 0:
		Transitioned.emit("PlayerIdleState")
		
	if Input.is_action_just_pressed("shoot"):
		Transitioned.emit("PlayerShootState")
		
	if Input.is_action_just_pressed("jump") and parent.is_on_floor():
		Transitioned.emit("PlayerJumpState")

