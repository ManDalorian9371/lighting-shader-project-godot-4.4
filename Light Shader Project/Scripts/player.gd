extends CharacterBody2D


const SPEED = 200.0

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var direction 

func _physics_process(_delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var new_direction = Input.get_axis("ui_left", "ui_right")
	if new_direction != direction :
		direction = new_direction
	if direction:
		velocity.x = direction * SPEED
		if direction > 0 :
			animated_sprite_2d.flip_h= false
			animated_sprite_2d.play("walk")
		elif direction < 0   :
			animated_sprite_2d.flip_h= true
			animated_sprite_2d.play("walk")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

		animated_sprite_2d.play("idle")

	move_and_slide()
