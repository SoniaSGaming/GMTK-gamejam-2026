extends CharacterBody2D

@export var speed = 300
var direction = Vector2.ZERO
var Dialog = false
var interact = false
var stun = false



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	velocity = Vector2.ZERO
	direction = Vector2.ZERO
	
	if Input.is_action_pressed("up") and stun == false:
		direction.y = -1
	if Input.is_action_pressed("down") and stun == false:
		direction.y = 1
	if Input.is_action_pressed("right") and stun == false:
		direction.x = 1
	if Input.is_action_pressed("left") and stun == false:
		direction.x = -1
	
	
	velocity = direction.normalized() * speed
	move_and_slide()
	
	if interact == true:
		print("yay")
	if interact == false:
		print("no")
	
	if interact == true:
		if Input.is_action_just_pressed("Interact") and Dialog == false:
			print("VORBESTE")
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/DialogStart.dialogue"), "start")
			Dialog = true
			stun = true
			Dialog_Start()

func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	interact = true


func _on_area_2d_body_exited(body: CharacterBody2D) -> void:
	interact = false

func Dialog_Start():
	
	var Dialog_Balloon = DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/DialogStart.dialogue"), "start")
	
	await Dialog_Balloon.tree_exited
	Dialog = false
	stun = false
	print("GATA")
