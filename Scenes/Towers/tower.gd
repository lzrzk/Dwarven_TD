extends Node
class_name Tower
#region base stats
@export var price:int
@export var fire_trough_ice:int
@export var range:int
@export var physical_dmg:float
@export var magical_dmg:float
@export var attack_speeds:float
@export var target:String
@export var enemiesInRange:Array
@export var upgraded_tower:PackedScene
@export var upgraded_tower2:PackedScene
@onready var type = "tower"
#endregion

func _process(delta: float) -> void:
	if len(self.enemiesInRange) > 0 and $attackTimer.time_left == 0:
		$attackTimer.start()
	$attackTimer.wait_time = self.attack_speeds

func shoot():
	if len(self.enemiesInRange) == 0:
		return
	
	# figure out what the region below is doing
	# observation 1: the shooting logic is embeded in the base script of towers by type
	# observation 2: mega towers dont have script or extend to their base version so they use this logic
	# observation 3: the script of mega towers is not attached to them so they work properly
	# conclusion: remove unattached script and leave this as base case:done + implement piercing damage
	# ammendum 1: i dont know where to put piercing attacks -> game design issue
	match self.target:
		"first":
			self.enemiesInRange[0].hit(self.physical_dmg,self.magical_dmg,self.fire_trough_ice,0)
		_:
			self.enemiesInRange[0].hit(self.physical_dmg,0,self.magical_dmg,0)
		"tri-shot":
			self.enemiesInRange[0].hit(self.physical_dmg,self.fire_trough_ice,self.magical_dmg,0)
			self.enemiesInRange[1].hit(self.physical_dmg/2,self.fire_trough_ice,self.magical_dmg/2,0)
			self.enemiesInRange[2].hit(self.physical_dmg/3,self.fire_trough_ice,self.magical_dmg/3,0)
		"piercing":
			self.enemiesInRange[0].hit(self.physical_dmg/2,self.magical_dmg/2,self.fire_trough_ice,self.magical_dmg/2 + self.physical_dmg/2)
			




func _ready() -> void:
	var range_shape = CircleShape2D.new()
	range_shape.radius = self.range * 10   #ConversionRate
	$Attack_range/CollisionShape2D.shape = range_shape



func _on_attack_range_body_exited(body: Node2D) -> void:
	if body.type == "enemy":
		self.enemiesInRange.erase(body)
func _on_attack_range_body_entered(body: Node2D) -> void:
	if body.type == "enemy":
		self.enemiesInRange.append(body)
		print(self.enemiesInRange)

#region buttons
func _on_upgrade_button_pressed() -> void:
	var up_tower= self.upgraded_tower.instantiate()
	up_tower.position = self.position
	if Variables.ore >= self.price:
		$"../".add_child(up_tower)
		Variables.ore-=self.price
		queue_free()

func _on_upgrade_button_2_pressed() -> void:
	var up_tower= self.upgraded_tower2.instantiate()
	up_tower.position = self.position
	if Variables.ore >= self.price:
		$"../".add_child(up_tower)
		Variables.ore-=self.price
		queue_free()

func _on_sell_button_pressed() -> void:
	Variables.ore += self.price/2
	var picker = load("res://Scenes/Towers/towerPicker.tscn") as PackedScene
	picker = picker.instantiate()
	picker.global_position = self.global_position
	add_sibling(picker)
	queue_free()

func _on_activate_button_pressed() -> void:
	$ActivateButton.visible = false
	$BackButton.visible = true
	$SellButton.visible = true
	if upgraded_tower != null:
		$UpgradeButton.visible = true
	Variables.selectedNode = self
	if upgraded_tower2 != null:
		$UpgradeButton2.visible = true

func _on_back_button_pressed() -> void:
	$ActivateButton.visible = true
	$BackButton.visible = false
	$UpgradeButton.visible = false
	$UpgradeButton2.visible = false
	$SellButton.visible = false
#endregion

#region show attack raduis logic
func _on_activate_button_mouse_entered() -> void:
	$Polygon2D.visible = true

func _on_activate_button_mouse_exited() -> void:
	$Polygon2D.visible = false
#endregion
