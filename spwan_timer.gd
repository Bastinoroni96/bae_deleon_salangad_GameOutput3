extends Timer


var mintime = 1
var maxtime = 5

func _ready() -> void:
	spawnTime()
	#connect("timeout",self,"spawnTime")
	

func spawnTime():
	set_wait_time(randf_range(mintime,maxtime))
