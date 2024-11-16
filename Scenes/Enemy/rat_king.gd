extends enemy

func _ready() -> void:
	self.damage = 1
	self.hp = 20
	self.speed = 150
	self.shieldsMagical = 0.8
	self.shieldsPhysical = 0.5
	self.pathFollow=PathFollow2D.new()
	
	Variables.enemyPath.add_child(self.pathFollow)
