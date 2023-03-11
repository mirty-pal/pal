extends CharacterBody2D

var hSpd = 0;
var vSpd = 0;
var pSpd = 2;
var pDir = 2;
@onready var animPlayer = $AnimationPlayer;



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	hSpd = Input.get_axis("Move Left","Move Right");
	vSpd = Input.get_axis("Move Up","Move Down");
	velocity = Vector2(hSpd, vSpd).normalized() * pSpd * 50;
	move_and_slide();


func _process(delta):
	if velocity.x < 0:
		$Sprite2D.scale.x = -1;
		pDir = 0;
	elif velocity.x > 0:
		$Sprite2D.scale.x = 1;	
		pDir = 0;
	
	if velocity.y < 0:
		pDir = 1;
	elif velocity.y > 0:
		pDir = 2;
		
	if velocity == Vector2.ZERO:
		match pDir:
			0:
				animPlayer.play("cat_idle_side");
			1:
				animPlayer.play("cat_idle_up");
			2:
				animPlayer.play("cat_idle_down");
	else:
		match pDir:
			0:
				animPlayer.play("cat_walk_side");
			1:
				animPlayer.play("cat_walk_up");
			2:
				animPlayer.play("cat_walk_down");
