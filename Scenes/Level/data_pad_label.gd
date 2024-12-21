extends RichTextLabel


'''
func _ready() -> void: 
	if type == "enemy":
		if mag_def == 1:
			m_def = "⬜⬜⬜"
		elif mag_def > 0.7 and mag_def < 1:
			m_def = "⬛⬜⬜"
		elif mag_def > 0.4 and mag_def < 0.7:
			m_def = "⬛⬛⬜"
		elif mag_def > 0 and mag_def < 0.4:
			m_def = "⬛⬛⬛"
		
	if type == "enemy":
		if ph_def == 1:
			p_def = "⬜⬜⬜"
		elif ph_def > 0.7:
			p_def = "⬛⬜⬜"
		elif ph_def > 0.4 and mag_def < 0.7:
			p_def = "⬛⬛⬜"
		elif ph_def > 0 and mag_def < 0.4:
			p_def = "⬛⬛⬛"
		
		var information_text = ["DEF:", m_def, p_def ,"SPD:", speed, "HP:", HP]
		
	elif type == "tower":
		var information_text = ["ATK:", m_atack, p_atack ,"SPD:", fire_rate,"RNG:", range]
		
	else:
		var information_text = "N/A"
	
	
	
	
	
	
	
	
func _process(delta: float) -> void:
	if trigered == true:
		$".".visible = true
	if trigered == false:
		$".".visible = false
'''
