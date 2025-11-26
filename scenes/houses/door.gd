extends StaticBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var interactable_component: InteractableComponent = $InteractableComponent

func _ready() -> void:
	interactable_component.interactable_activated.connect(on_interactable_activated)
	interactable_component.interactable_deactivated.connect(on_interactable_deactivated)
	collision_layer = 1
	
func on_interactable_activated() -> void:
	animated_sprite_2d.play("open_door")
	# move the door's layer from 1 (wall) to 2 (player) so that the door can't block the player anymore
	collision_layer = 2
	
func on_interactable_deactivated() -> void:
	animated_sprite_2d.play("close_door")
	collision_layer = 1
	


func _on_interactable_component_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	pass # Replace with function body.
