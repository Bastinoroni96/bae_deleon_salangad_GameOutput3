extends CharacterBody2D

var Bullet = preload("res://enemyBullet.tscn")

var player = null
var canShoot = true


@export var speed = 2
@export var health = 3
@onready var spawnpos = $SpawnPos
@onready var muzzleflash = $Muzzleflash

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player = body

func _physics_process(delta: float) -> void:
	var movement = Vector2(-2,0)
	
	if player:
		movement = position.direction_to(player.position) * speed
	movement = move_and_collide(movement)


func _on_shoot_speed_timeout() -> void: 
	canShoot = true
	if player != null:
		shoot()
		
func shoot():
	if canShoot:
		var bullet = Bullet.instantiate()
		bullet.position = spawnpos.global_position
		get_parent().add_child(bullet)
		
		muzzleflash.play("Muzzleflash")
		$ShootSpeed. start()
		canShoot = false
		
func enemy_hit():
	health -= 1
	if health == 0:
		Global.score += 5
		queue_free()
