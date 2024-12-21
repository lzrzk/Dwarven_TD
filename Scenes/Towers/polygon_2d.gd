extends Polygon2D


func _draw() -> void:
	var father = $".."
	draw_circle(Vector2(0,0),father.range * 10,Color(100,100,100,0.2),true,1,false)
