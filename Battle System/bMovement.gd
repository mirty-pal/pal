extends CharacterBody2D

var target = Vector2.ZERO;
var hspd = 0;
var vspd = 0;
var pSpd = 2;
var spriteArr = [["ness_ul","ness_l","ness_dl"],["ness_u","ness_forward","ness_forward"],["ness_ur","ness_r","ness_dr"]];
var shiftKey = false;
var Targetpos;
func _ready():
	print(spriteArr[1][1]);
	$AnimationPlayer.speed_scale = 2;
	Targetpos = get_node("/root/Node2D/looktest");
func _physics_process(delta):
	hspd = Input.get_axis("Move Left","Move Right");
	vspd = Input.get_axis("Move Up","Move Down");
	shiftKey = Input.is_key_pressed(KEY_SHIFT);
	velocity = Vector2(hspd, vspd).normalized()*pSpd;
	move_and_collide(velocity * 50 * delta);
	
	#Triangle math:
	print(Targetpos.position.x)
	var xDiff = position.x - Targetpos.position.x;
	var yDiff = position.y - Targetpos.position.y;
	print("xDiff: " + str(xDiff))
	print("yDiff: " + str(yDiff))
	if(!shiftKey):
		if(velocity != Vector2.ZERO):
			$AnimationPlayer.play(spriteArr[hspd+1][vspd+1]);
		else:
			$AnimationPlayer.seek(1,true)
