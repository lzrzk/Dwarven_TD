extends Tower



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	self.attack_speeds = 0.4
	self.magical_dmg = 1
	self.physical_dmg = 0
	self.target = "first"
	$attackTimer.wait_time = self.attack_speeds


# Called every frame. 'delta' is the elapsed time since the previous frame.