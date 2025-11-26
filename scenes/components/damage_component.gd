class_name DamageComponent
extends Node2D

@export var max_health = 1
@export var current_health: int

signal max_damage_reached

func _ready() -> void:
	current_health = max_health

func apply_damage(damage: int) -> void:
	current_health = current_health - damage
	
	if current_health <= 0:
		max_damage_reached.emit()
