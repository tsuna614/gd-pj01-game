extends AnimatedSprite2D

@onready var animated_sprite_2d: AnimatedSprite2D = $"."
@onready var interactable_component: InteractableComponent = $InteractableComponent
@onready var static_body_2d: StaticBody2D = $StaticBody2D

func _ready() -> void:
	interactable_component.interactable_activated.connect(on_interactable_activated)
	interactable_component.interactable_deactivated.connect(on_interactable_deactivated)
	#static_body_2d.collision_layer = 1
	
func on_interactable_activated() -> void:
	animated_sprite_2d.play("open_chest")
	#static_body_2d.collision_layer = 2
	
func on_interactable_deactivated() -> void:
	animated_sprite_2d.play("close_chest")
	#static_body_2d.collision_layer = 1
