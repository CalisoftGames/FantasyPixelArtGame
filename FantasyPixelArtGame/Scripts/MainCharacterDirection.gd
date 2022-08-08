extends Sprite

	
const SPRITES_MAP := {
	Vector2.RIGHT: state_machine.travel("walkHorizontal_Right"),
	Vector2.DOWN: state_machine.travel("walkHorizontal_Left"),
	Vector2.LEFT: state_machine.travel("walkHorizontal_Left"),
	Vector2.UP: state_machine.travel("walkHorizontal_Right"),
	Vector2(1.0, 1.0): state_machine.travel("walkHorizontal_Right"),
	Vector2(1.0, -1.0): state_machine.travel("walkHorizontalLeft"),
	Vector2(-1.0, -1.0): state_machine.travel("walkHorizontal_Left"),
	Vector2(-1.0, 1.0): state_machine.travel("walkHorizontal_Right")
}

var look_direction := Vector2.RIGHT

func _process(_delta: float) -> void:
	var input_vector := Vector2(
		float(Input.is_action_pressed("ui_right")) - float(Input.is_action_pressed("ui_left")),
		float(Input.is_action_pressed("ui_down")) - float(Input.is_action_pressed("ui_up"))
	)

	if input_vector.length() > 0.0 and input_vector != look_direction:
		animation = SPRITES_MAP[input_vector]
		look_direction = input_vector
	flip_h = sign(look_direction.x) == -1.0
		
	position.y = sin(OS.get_ticks_msec() / 200.0) * 1.0
