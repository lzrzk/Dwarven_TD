extends Label
var calm_text_1 = "We have few hours to rest. Better string the bows."
var calm_text_2 = "They just won't stop."
var calm_text_3 = "I should get few rocks cracked."
var worried_text_1 = "The gate has to be repaired or... No they won't break through"
var worried_text_2 = "Gate is severly damaged. I hope we'll stop them this time."
var worried_text_3 = "The vineyards aren't going to help. Its just us."
var rare_text_1 = "Rock and stone to the bone."
var rare_text_2 = "Wait those rodents aren't paying taxes... So IRS should be here soon."
var rare_text_3 = "So is it Moria or Underdark maybe Hoxes...  Anyway anything is better than Skaven."
var rare_text_4 = "So I should defend towers is it some kind of Dwarven™: Tower Defense."
var rare_text_5 = "Die xeno-scum or for super-earth... Oh right for Karl."
var rare_text_6_1 = "..."
var rare_text_6_2 = "..."
var rare_text_6_3 = "You know I'm not obliged to speak"
var rare_text_7 = "The rose sounds windy today. Am I hearing some kind of Wind Rose."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _on_visibility_changed() -> void:
	var text_type = randi_range(1,7)
	if text_type == 7:
		var text_subtype = randi_range(1,7)
		if text_subtype == 1:
			text = rare_text_1
		if text_subtype == 2:
			text = rare_text_2
		if text_subtype == 3:
			text = rare_text_3
		if text_subtype == 4:
			text = rare_text_4
		if text_subtype == 5:
			text = rare_text_5
		if text_subtype == 6:
			text = rare_text_1
		if text_subtype == 7:
			text = rare_text_7
