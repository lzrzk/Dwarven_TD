extends Area2D

@export var enemy:CharacterBody2D
@export var type:String = "bullet"
@export var can_damage = true
@export var physical_dmg:float
@export var magical_dmg:float
@export var fire_trough_ice:float

func setDmg(ph,mg,fire_th):
	self.physical_dmg = ph
	self.magical_dmg = mg
	self.fire_trough_ice = fire_th
	
func _ready() -> void:
	self.global_position = self.enemy.global_position
	$ExpirationTimer.wait_time = randf_range(0.5,3)
	$ExpirationTimer.start()
	if fire_trough_ice < 0:
		$Sprite2D.modulate = Color("#ff6666")


func _on_body_entered(body: Node2D) -> void:
	if body.type == "enemy" and can_damage:
		can_damage = false
		body.hit(physical_dmg,magical_dmg,fire_trough_ice,0)


func _on_expiration_timer_timeout() -> void:
	queue_free()
