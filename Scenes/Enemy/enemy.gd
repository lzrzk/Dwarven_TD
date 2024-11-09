extends Area2D

class_name enemy

@export var hp:int

@onready var type = "enemy"

@export var speed:int

@export var shieldsPhysical:int

@export var shieldsMagical:int

@export var damage:int

@export var path:Path2D

@export var pathFollow:PathFollow2D

"""
func _init(hp, spd, shPh, shMg, dmg):
	self.hp = hp
	self.speed = spd
	self.shields_magical = shMg
	self.shields_physical = shPh
	self.damage = dmg
"""

func _process(delta: float) -> void:
	self.pathFollow.progress += self.speed * delta
	self.position = self.pathFollow.position
	self.rotation = self.pathFollow.rotation
	$Sprite2D.flip_v = self.rotation > 0


func hit(dmg):
	hp -= dmg
	if hp <= 0:
		self.queue_free()
