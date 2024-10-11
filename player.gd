extends CharacterBody2D

var Bullet = preload("res://projectile.tscn")

var health = 3 
@export var speed = 300
@export var canshoot = true

@onready var spawnpos = $Spawnpos
@onready var spawnpos2 = $Spawnpos2 
@onready var muzzleflash =  $Muzzleflash
@onready var muzzleflash2 =  $Muzzleflash2


func _process(delta: float) -> void:
	var move = Input.get_vector("left", "right", "up", "down")
	
	if move:
		velocity = move * speed
	else:
		velocity = Vector2.ZERO
	move_and_slide()

	global_position.x = clamp(global_position.x, 30, 440)
	global_position.y = clamp(global_position.y, 40, 565)
	
	if Input.is_action_pressed("shoot") and canshoot:
		shoot()
	

func _on_shootspeed_timeout() -> void:
	canshoot = true

func shoot():
	var bullet = Bullet.instantiate()  
	bullet.position = spawnpos.global_position
	get_tree().current_scene.add_child(bullet)
	
	muzzleflash.play("muzzleflash")
	$Shootspeed.start()
	canshoot = false
	
	var bullet2 = Bullet.instantiate() 
	bullet2.position = spawnpos2.global_position
	get_tree().current_scene.add_child(bullet2)  
	
	muzzleflash2.play("muzzleflash2")
	$Shootspeed.start()
	
func player_hit():
	health -=1
	Global.health -=1
	if health == 0:
		get_tree().reload_current_scene()
		Global.score = 0
		Global.health =3
		queue_free()
