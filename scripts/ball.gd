extends RigidBody2D

@export var speed = 60
@export var maxSpeed = 400
var canMove = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	contact_monitor = true	
	max_contacts_reported = 15
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()
	
	var vertMove: float = Input.get_axis("up", "down")
	var horizMove: float = Input.get_axis("left", "right")
	if get_contact_count() > 0:
		canMove = true
	if canMove && (vertMove != 0 || horizMove != 0) :		
		#if vertMove == 0:
			#if randf() > .5:
				#vertMove = -0.5
			#else :
				#vertMove = 0.5
		
		if linear_velocity.length() > maxSpeed:
			print("too fast!")
			return
		
		var impulseVect = Vector2(horizMove, vertMove)
		impulseVect = impulseVect.normalized()
		impulseVect.y *= 1.6
		print("moving ", speed," and ", impulseVect)
		apply_impulse(impulseVect * speed)
		#apply_impulse(Vector2(impulseVect.y * speed,impulseVect.x * (speed/2)))
		canMove = false
	pass


func _on_body_entered(body: Node) -> void:
	print("colliding")
	canMove = true
	pass # Replace with function body.
