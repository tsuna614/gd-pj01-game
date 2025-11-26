class_name InteractableComponent
extends Area2D

signal interactable_activated
signal interactable_deactivated

# scan for the Mask (see inspector of InteractableComponent).
# in this case it scan for nodes in layer 2, which is the player
# when player enters, this signal is emitted.
# This component can be seen used in objects such as Door
func _on_body_entered(body: Node2D) -> void:
	interactable_activated.emit()


func _on_body_exited(body: Node2D) -> void:
	interactable_deactivated.emit()
