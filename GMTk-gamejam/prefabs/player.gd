extends CharacterBody2D

@export var speed = 300
var direction = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	velocity = Vector2.ZERO
	direction = Vector2.ZERO
	
	if Input.is_action_pressed("up"):
		direction.y = -1
	if Input.is_action_pressed("down"):
		direction.y = 1
	if Input.is_action_pressed("right"):
		direction.x = 1
	if Input.is_action_pressed("left"):
		direction.x = -1
	
	#print(velocity)
	
	velocity = direction.normalized() * speed
	move_and_slide()
