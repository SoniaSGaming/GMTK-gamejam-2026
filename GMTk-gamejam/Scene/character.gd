extends CharacterBody2D


var speed = 50

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	if Input.is_action_pressed("up"):
		velocity.y -= speed * delta
	if Input.is_action_pressed("down"):
		velocity.y += speed * delta
	if Input.is_action_pressed("left"):
		velocity.x -= speed * delta
	if Input.is_action_pressed("right"):
		velocity.x += speed * delta

	velocity = velocity.normalized()
