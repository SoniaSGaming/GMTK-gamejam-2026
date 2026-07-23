extends CharacterBody2D

@export var speed = 300
var direction = Vector2.ZERO
@onready var _animated_sprite = $AnimatedSprite2D
var direction_old

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	direction_old = direction
	
	velocity = Vector2.ZERO
	direction = Vector2.ZERO
	
	#_animated_sprite.play("walk_front")
	
	if Input.is_action_pressed("up"):
		direction.y = -1
		_animated_sprite.play("walk_back")
	if Input.is_action_pressed("down"):
		direction.y = 1
		_animated_sprite.play("walk_front")
	if Input.is_action_pressed("right"):
		direction.x = 1
		_animated_sprite.play("walk_right")
	if Input.is_action_pressed("left"):
		direction.x = -1
		_animated_sprite.play("walk_left")
	
	#print(velocity)
	
	velocity = direction.normalized() * speed
	if velocity.x == 0 && velocity.y == 0:
		if direction_old.x == 1:
			_animated_sprite.play("idle_right")
		if direction_old.y == 1:
			_animated_sprite.play("idle_front")
		if direction_old.y == -1:
			_animated_sprite.play("idle_back")
		if direction_old.x == -1:
			_animated_sprite.play("idle_left")
	
	move_and_slide()
