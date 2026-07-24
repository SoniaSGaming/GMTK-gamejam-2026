extends Label

@export var time_period = 1

var seconds

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	seconds = time_period * 60


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.text = str(seconds/60) + ":" + str(seconds%60)


func _on_timer_timeout() -> void:
	if seconds!=0:
		seconds-=1
