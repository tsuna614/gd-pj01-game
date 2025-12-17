extends Node2D

@onready var hurt_component: HurtComponent = $HurtComponent
@onready var damage_component: DamageComponent = $DamageComponent
@onready var sprite_2d: Sprite2D = $Sprite2D

var log_scene = preload("res://scenes/objects/trees/log.tscn")

func _ready() -> void:
	hurt_component.on_hurt_signal.connect(on_hurt)
	damage_component.max_damage_reached.connect(on_max_damage_reached)

func on_hurt(hit_damage: int) -> void:
	damage_component.apply_damage(hit_damage)
	
	# shake tree when being chopped
	sprite_2d.material.set_shader_parameter("shake_intensity", 0.5)
	await get_tree().create_timer(0.5).timeout
	sprite_2d.material.set_shader_parameter("shake_intensity", 0.0)

func on_max_damage_reached() -> void:
	print("Max damage reached")
	call_deferred("add_log_scene")
	queue_free()

func add_log_scene() -> void:
	var log_instance = log_scene.instantiate() as Node2D
	get_parent().add_child(log_instance) # add log scene to the parent scene of this tree, essentially replacing the tree object with the log object
	log_instance.global_position = global_position
	
