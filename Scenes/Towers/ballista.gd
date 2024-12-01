extends Tower


func _ready() -> void:
	
	self.attack_speeds = 2
	self.magical_dmg = 0
	self.physical_dmg = 5
	self.target = "first"
	$attackTimer.wait_time = self.attack_speeds
