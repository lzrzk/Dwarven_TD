extends enemy

func _ready() -> void:
	self.damage = 1
	self.hp = 20
	self.speed = 200
	self.shieldsMagical = 1
	self.shieldsPhysical = 1
	self.pathFollow=PathFollow2D.new()
	self.maxHp = self.hp

	
	Variables.enemyPath.add_child(self.pathFollow)
