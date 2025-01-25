extends Area2D


@export var speed:float = 30
@export var physical_dmg:float
@export var magical_dmg:float

@export var angle:float = 0
@export var enemy:CharacterBody2D
@export var type:String = "bullet"
@export var can_damage = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	angle = get_angle_to(enemy.position)
	self.rotation = get_angle_to(enemy.position) + PI/2
func _process(delta):
	# self destory
	if position.x < -200 or position.x > 2000 or position.y < -200 or position.y >10000:
		queue_free() 
	# movement
	self.position+=Vector2.RIGHT.rotated(angle).normalized()*(speed)



func _on_body_entered(body: Node2D) -> void:
	if body.type == "enemy" and can_damage:
		can_damage = false
		body.hit(physical_dmg,magical_dmg,0)
		queue_free()

	
