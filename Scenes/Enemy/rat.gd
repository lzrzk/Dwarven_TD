extends enemy

func _ready() -> void:
	self.damage = 1
	self.hp = 20
	self.speed = 200
	self.shieldsMagical = 1
	self.shieldsPhysical = 1
	self.pathFollow=PathFollow2D.new()
	
	Variables.enemyPath.add_child(self.pathFollow)

func hit(magical_dmg,shieldsMagical,physical_dmg,shieldsPhysical) -> void:
	if hit == True:
		TrueDmg = 1
		magDmgTrue = magical_dmg * shieldsMagical
		physDmgTrue = physical_dmg * shieldsPhysical
		IncomingDmg = physDmgTrue + magDmgTrue + TrueDmg
	else:
		pass
