extends Timer

var mintime = 1
var maxtime = 5

func _ready() -> void:
	spawnTime()
	self.timeout.connect(spawnTime)
	start() # Start the timer

func spawnTime() -> void:
	set_wait_time(randf_range(mintime, maxtime))
	start()
