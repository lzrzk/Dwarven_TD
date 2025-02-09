extends CharacterBody2D

class_name enemy

@export var hp:float
@export var maxHp:float
@onready var type = "enemy"
@export var fire_trough_ice:int
@export var speed:int
@export var spawnedOnDeath:PackedScene
@export var shieldsPhysical:float
@export var shieldsMagical:float
@export var damage:int
@export var path:Path2D
@export var pathFollow:PathFollow2D
@export var oreGiven:int
@export var speed_decreased = false
@export var permafrost = false

func _ready() -> void:
	fire_trough_ice == 0
	self.pathFollow=PathFollow2D.new()
	Variables.enemyPath.add_child(self.pathFollow)
	


func _process(delta: float) -> void:
	self.pathFollow.progress += self.speed * delta
	self.position = self.pathFollow.position
	self.rotation = self.pathFollow.rotation
	$Sprite2D.flip_v = self.rotation > 0
	$hp.value = float(hp)/float(maxHp) *100
	
	
	if self.pathFollow.get_progress_ratio() >= 0.98:
		
		Variables.lives -= self.damage
		self.queue_free()





func hit(magical_dmg, physical_dmg,fire_trough_ice, true_dmg,) -> void:
	print(fire_trough_ice)
	
	var magDmgTrue = magical_dmg * shieldsMagical
	var physDmgTrue = physical_dmg * shieldsPhysical
	var incomingDmg = physDmgTrue + magDmgTrue + true_dmg
	self.fire_trough_ice +=  fire_trough_ice
	self.hp -= incomingDmg
	if self.hp <= 0:
		if self.spawnedOnDeath != null:
			print("eevee")
			var spawnedOnDeathUnpacked = self.spawnedOnDeath
			spawnedOnDeathUnpacked.position = self.position
			$"../".add_child(spawnedOnDeathUnpacked)
			
			
		Variables.ore += oreGiven
		self.queue_free()




func _on_info_button_pressed() -> void:
	Variables.selectedNode = self


func _on_fire_frost_timer_timeout() -> void:
	if self.speed_decreased:
		self.speed *= 2
	if self.fire_trough_ice == 0:
		pass
	elif self.fire_trough_ice > 0:
		self.hp -= self.fire_trough_ice
		self.fire_trough_ice -= 1
	elif self.fire_trough_ice < 0:
		if self.fire_trough_ice < 20 and permafrost:
			self.speed *= 0.9
			var permafrost = true
		self.speed /= 2
		self.fire_trough_ice +=1
		self.speed_decreased = true
