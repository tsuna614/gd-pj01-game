extends Node2D

@onready var hurt_component: HurtComponent = $HurtComponent
@onready var damage_component: DamageComponent = $DamageComponent
@onready var sprite_2d: Sprite2D = $Sprite2D

var stone_scene = preload("res://scenes/objects/rocks/stone.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hurt_component.on_hurt_signal.connect(on_hurt)
	damage_component.max_damage_reached.connect(on_max_damage_reached)


func on_hurt(hit_damage: int) -> void:
	damage_component.apply_damage(hit_damage)

func on_max_damage_reached() -> void:
	call_deferred("add_stone")
	queue_free()
	
func add_stone() -> void:
	var stone_instance = stone_scene.instantiate() as Node2D
	
	#stone_instance.global_position = global_position
	#get_parent().add_child(stone_instance)
	
	# reverse the order for the time being,
	# because I still haven't figured out why the stone's
	# position is being offset to this rock position
	get_parent().add_child(stone_instance)
	stone_instance.global_position = global_position

## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
