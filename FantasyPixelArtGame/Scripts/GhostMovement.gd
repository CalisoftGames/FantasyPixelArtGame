extends KinematicBody2D

export var speed := 50.0

onready var animation_tree = $AnimationTree
onready var state_machine = animation_tree.get("parameters/playback")

# Called when the node enters the scene tree for the first time.
func _ready():
	state_machine.travel("Walk_Horizontal")


func _physics_process(delta: float) -> void:
	var input_vector := Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)

	var move_direction := input_vector.normalized()
	move_and_slide(speed * move_direction)
