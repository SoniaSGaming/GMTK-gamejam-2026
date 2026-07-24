extends StaticBody2D

@export var dialogue_resource: DialogueResource
@export var start_title: String = "start"

func get_dialogue_resource() -> DialogueResource:
	return dialogue_resource

func get_start_title() -> String:
	return start_title
