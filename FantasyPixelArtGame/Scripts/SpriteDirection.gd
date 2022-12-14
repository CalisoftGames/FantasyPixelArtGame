extends Sprite

	
const SPRITES_MAP := {
	Vector2.RIGHT: preload("res://.import/Ebony Final version horiz-walk.png-693e457284a09dc3e5fe265dbc9b9e65.stex"),
	Vector2.DOWN: preload("res://.import/Ebony Final version horiz-walk.png-693e457284a09dc3e5fe265dbc9b9e65.stex"),
	Vector2.LEFT: preload("res://.import/Ebony Final version horiz-walk.png-693e457284a09dc3e5fe265dbc9b9e65.stex"),
	Vector2.UP: preload("res://.import/Ebony Final version horiz-walk.png-693e457284a09dc3e5fe265dbc9b9e65.stex"),
	Vector2(1.0, 1.0): preload("res://.import/Ebony Final version horiz-walk.png-693e457284a09dc3e5fe265dbc9b9e65.stex"),
	Vector2(1.0, -1.0): preload("res://.import/Ebony Final version horiz-walk.png-693e457284a09dc3e5fe265dbc9b9e65.stex"),
	Vector2(-1.0, -1.0): preload("res://.import/Ebony Final version horiz-walk.png-693e457284a09dc3e5fe265dbc9b9e65.stex"),
	Vector2(-1.0, 1.0): preload("res://.import/Ebony Final version horiz-walk.png-693e457284a09dc3e5fe265dbc9b9e65.stex"),
}

var look_direction := Vector2.RIGHT

func _process(_delta: float) -> void:
	var input_vector := Vector2(
		float(Input.is_action_pressed("ui_right")) - float(Input.is_action_pressed("ui_left")),
		float(Input.is_action_pressed("ui_down")) - float(Input.is_action_pressed("ui_up"))
	)

	if input_vector.length() > 0.0 and input_vector != look_direction:
		texture = SPRITES_MAP[input_vector]
		look_direction = input_vector
	flip_h = sign(look_direction.x) == -1.0
		
	position.y = sin(OS.get_ticks_msec() / 200.0) * 1.0
