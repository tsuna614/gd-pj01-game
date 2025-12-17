extends NodeState

@export var player: Player
@export var animated_sprite_2d: AnimatedSprite2D
@export var speed: int = 100

@export var hit_component_collision_shape: CollisionShape2D

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	var direction: Vector2 = GameInputEvents.movement_input()
	
	# play the walking animation based on the input direction
	if direction == Vector2.UP:
		animated_sprite_2d.play("walking_back")
	elif direction == Vector2.DOWN:
		animated_sprite_2d.play("walking_front")
	elif direction == Vector2.LEFT:
		animated_sprite_2d.play("walking_left")
	elif direction == Vector2.RIGHT:
		animated_sprite_2d.play("walking_right")
	
	# set the player's direction to the input direction
	if direction != Vector2.ZERO:
		player.player_direction = direction
	
	# setting multiplier and moving player's HitComponent's hitbox based on direction
	var multiplier = 0
	if player.player_direction == Vector2.UP:
		multiplier = 18;
	elif player.player_direction == Vector2.DOWN:
		multiplier = 3;
	else:
		multiplier = 9;
	hit_component_collision_shape.position = player.player_direction * multiplier;
	
	# move the player
	player.velocity = direction * speed
	player.move_and_slide()


func _on_next_transitions() -> void:
	if !GameInputEvents.is_movement_input():
		transition.emit("Idle")


func _on_enter() -> void:
	pass


func _on_exit() -> void:
	animated_sprite_2d.stop()
