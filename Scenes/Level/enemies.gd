extends Node

signal enemy_dead
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_child_exiting_tree(node: Node) -> void:
	if node is enemy:
		var en := node as enemy
		enemy_dead.emit()
