extends RichTextLabel


func towerInfo() -> String:
	var atk = Variables.selectedNode.physical_dmg + Variables.selectedNode.magical_dmg
	var cost = Variables.selectedNode.price
	var spd = "N/A"
	var type = "N/A"
	if Variables.selectedNode.physical_dmg >= 0 and Variables.selectedNode.magical_dmg == 0:
		type = "physical"
	elif Variables.selectedNode.physical_dmg == 0 and Variables.selectedNode.magical_dmg >= 0:
		type = "magical"
	else:
		type = "combined"
	if Variables.selectedNode.attack_speeds >= 2:
		spd = "⬜⬜⬜"
	elif Variables.selectedNode.attack_speeds >= 1.2 and Variables.selectedNode.attack_speeds <= 2:
		spd = "⬛⬜⬜"
	elif Variables.selectedNode.attack_speeds >= 0.7 and Variables.selectedNode.attack_speeds <= 1.2:
		spd = "⬛⬛⬜"
	elif Variables.selectedNode.attack_speeds >= 0 and Variables.selectedNode.attack_speeds <= 0.7:
		spd = "⬛⬛⬛"
	var text = "ATK: {atk} SPD: {spd} COST: {cost} TYPE: {type}".format({"atk":atk,"spd":spd,"cost":cost,"type":type})
	return text

func enemyInfo() -> String:
	var m_def = "N/A"
	var p_def = "N/A"
	var spd = "N/A"
	if Variables.selectedNode.shieldsMagical == 1:
		m_def = "⬜⬜⬜"
	elif Variables.selectedNode.shieldsMagical > 0.7 and Variables.selectedNode.shieldsMagical < 1:
		m_def = "⬛⬜⬜"
	elif Variables.selectedNode.shieldsMagical > 0.4 and Variables.selectedNode.shieldsMagical < 0.7:
		m_def = "⬛⬛⬜"
	elif Variables.selectedNode.shieldsMagical > 0 and Variables.selectedNode.shieldsMagical < 0.4:
		m_def = "⬛⬛⬛"
	if Variables.selectedNode.shieldsPhysical == 1:
		p_def = "⬜⬜⬜"
	elif Variables.selectedNode.shieldsPhysical > 0.7 and Variables.selectedNode.shieldsPhysical < 1:
		p_def = "⬛⬜⬜"
	elif Variables.selectedNode.shieldsPhysical > 0.4 and Variables.selectedNode.shieldsPhysical < 0.7:
		p_def = "⬛⬛⬜"
	elif Variables.selectedNode.shieldsPhysical > 0 and Variables.selectedNode.shieldsPhysical < 0.4:
		p_def = "⬛⬛⬛"
	if Variables.selectedNode.speed < 100:
		spd = "⬜⬜⬜"
	elif Variables.selectedNode.speed > 99 and Variables.selectedNode.speed < 200:
		spd = "⬛⬜⬜"
	elif Variables.selectedNode.speed > 199 and Variables.selectedNode.speed < 300:
		spd = "⬛⬛⬜"
	elif Variables.selectedNode.speed > 299:
		spd = "⬛⬛⬛"
	var text = "DEF: {m_def} {p_def} SPD: {spd} HP: {hp}".format({"m_def":m_def,"p_def":p_def,"spd":spd,"hp":round(Variables.selectedNode.hp)})

	return text







func _ready() -> void: 
	pass

func _process(delta: float) -> void:
	self.visible= Variables.selectedNode != null
	$"../HideInfoButton".visible = Variables.selectedNode != null
	
	if Variables.selectedNode != null:
		
		if Variables.selectedNode.type == "enemy":
			self.text = enemyInfo()
		if Variables.selectedNode.type == "tower":
			self.text = towerInfo()

func _on_hide_info_button_pressed() -> void:
	Variables.selectedNode = null
