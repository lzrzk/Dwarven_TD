extends Tower

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_attack_range_area_entered(area: Area2D) -> void:
	if area.type == "enemy":
		print("ENEMY")


func _on_attack_range_area_exited(area: Area2D) -> void:
	if area.type == "enemy":
		print("NO ENEMY")
