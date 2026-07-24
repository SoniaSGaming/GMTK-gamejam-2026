extends CharacterBody2D

@export var speed = 300
@export var timer: Label

var direction = Vector2.ZERO
var direction_old
var Dialog = false
var interact = false
var stun = false
@onready var _animated_sprite = $AnimatedSprite2D
var direction_old
const Balloon = preload("res://Dialogue/Balloon/balloon.tscn")
var current_npc = null  # the NPC we're currently overlapping

var collection = [0, 0, 0, 0, 0, 0, 0]

@onready var _animated_sprite = $AnimatedSprite2D

func _process(delta: float) -> void:
	direction_old = direction

	velocity = Vector2.ZERO
	direction = Vector2.ZERO

	if Input.is_action_pressed("up") and stun == false:
		direction.y = -1
		_animated_sprite.play("walk_back")
	if Input.is_action_pressed("down") and stun == false:
		direction.y = 1
		_animated_sprite.play("walk_front")
	if Input.is_action_pressed("right") and stun == false:
		direction.x = 1
		_animated_sprite.play("walk_right")
	if Input.is_action_pressed("left") and stun == false:
		direction.x = -1
		_animated_sprite.play("walk_left")

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
	
	print(interact)

	if interact and current_npc != null:
		if Input.is_action_just_pressed("Interact") and Dialog == false:
			Dialog = true
			stun = true
			Dialog_Start(current_npc)
	
	print(collection)


func _on_area_2d_body_entered(body: Node2D) -> void:
	# Only react to actual NPCs, not walls/other physics bodies
	if body.has_method("get_dialogue_resource"):
		interact = true
		current_npc = body
	
	elif body.has_method("get_item_name"):
		collection[body.get_item_id()] = 1
		print(body.get_item_name())
		timer.seconds += body.get_time()
		body.free()


func Dialog_Start():
	
	var Dialog_Balloon = DialogueManager.show_dialogue_balloon_scene(Balloon,load("res://Dialogue/DialogStart.dialogue"),"start")
	
func _on_area_2d_body_exited(body: Node2D) -> void:
	if body == current_npc:
		interact = false
		current_npc = null


func Dialog_Start(npc) -> void:
	var dialogue_resource = npc.get_dialogue_resource()
	var start_title = npc.get_start_title()

	var Dialog_Balloon = DialogueManager.show_example_dialogue_balloon(dialogue_resource, start_title)

	await Dialog_Balloon.tree_exited
	Dialog = false
	stun = false
