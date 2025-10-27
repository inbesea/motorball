extends Node2D

@onready var player: RigidBody2D = $Ball
@onready var path: Path2D = $Path2D
@onready var indicator: Sprite2D = $Sprite2D
@onready var label:Label = $Sprite2D/Label
var curve: Curve2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	curve = path.curve


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var closestPos:Vector2 = curve.get_closest_point(player.position)
	#var point_pos: Vector2 = curve.get_point_position(index)
	var point_progress_ratio: float = curve.get_closest_offset(closestPos)
	label.text = str(point_progress_ratio)
	indicator.position = closestPos
	
