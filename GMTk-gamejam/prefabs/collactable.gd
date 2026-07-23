extends StaticBody2D

@export var item_id = 1
@export var item_name = "soda"
@export var icon: CompressedTexture2D
@export var bonus_time = 0

func _ready():
	$Sprite2D.texture = icon

func get_time() -> int:
	return bonus_time

# Called when the node enters the scene tree for the first time.
func get_item_name() -> String:
	return item_name

func get_item_id() -> int:
	return item_id
