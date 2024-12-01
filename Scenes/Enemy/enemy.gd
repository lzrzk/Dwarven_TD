extends Area2D

class_name enemy

@export var hp:int
@export var maxHp:int
@onready var type = "enemy"

@export var speed:int

@export var shieldsPhysical:float

@export var shieldsMagical:float

@export var damage:int

@export var path:Path2D

@export var pathFollow:PathFollow2D

func _ready() -> void:
	self.pathFollow=PathFollow2D.new()
	Variables.enemyPath.add_child(self.pathFollow)


func _process(delta: float) -> void:
	self.pathFollow.progress += self.speed * delta
	self.position = self.pathFollow.position
	self.rotation = self.pathFollow.rotation
	$Sprite2D.flip_v = self.rotation > 0
	$hp.value = float(hp)/float(maxHp) *100


func hit(magical_dmg, physical_dmg, true_dmg) -> void:
	
	var magDmgTrue = magical_dmg * shieldsMagical
	var physDmgTrue = physical_dmg * shieldsPhysical
	var incomingDmg = physDmgTrue + magDmgTrue + true_dmg
	self.hp -= incomingDmg
	if hp <= 0:
		self.queue_free()
