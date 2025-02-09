extends Area2D

@export var physical_dmg:float
@export var magical_dmg:float

@export var enemy:CharacterBody2D
@export var type:String = "bullet"
@export var can_damage = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.position = enemy.position
	$ExpirationTimer.wait_time = 1
	$ExpirationTimer.start


func _on_expiration_timer_timeout() -> void:
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.type == "enemy" and can_damage:
		body.hit(physical_dmg,magical_dmg,0)
		queue_free()
