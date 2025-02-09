extends Area2D

@export var enemy:CharacterBody2D
@export var type:String = "bullet"
@export var can_damage = true

func _ready() -> void:
	print("shot")
	self.position = enemy.position
	$ExpirationTimer.wait_time = 1
	$ExpirationTimer.start


func _on_expiration_timer_timeout() -> void:
	queue_free()
