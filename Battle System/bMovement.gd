extends CharacterBody2D

var target = Vector2.ZERO;
var hspd = 0;
var vspd = 0;
var pSpd = 2;
var spriteArr = [["ness_ul","ness_l","ness_dl"],["ness_u","ness_forward","ness_forward"],["ness_ur","ness_r","ness_dr"]];
var shiftKey = false;
var Targetpos;
var DebugLine;
var points;
var counter = 0;
func _ready():
	print(spriteArr[1][1]);
	$AnimationPlayer.speed_scale = 2;
	Targetpos = get_node("/root/Node2D/looktest");
	DebugLine = get_node("/root/Node2D/Line2D");
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
	var relAngle = floor((atan2(yDiff,xDiff)*(180/PI))/22.5)
	var turnVal = floor(relAngle/60);
	print("angle: " + str(relAngle))
	
	
	print("turn: " + str(relAngle))
	if(!shiftKey):
		if(velocity != Vector2.ZERO):
			$AnimationPlayer.play(spriteArr[hspd+1][vspd+1]);
		else:
			$AnimationPlayer.seek(1,true)
	else:
		if(relAngle == 0 or relAngle == -1):
			$AnimationPlayer.play("ness_l");
		elif(relAngle == -2 or relAngle == -3):
			$AnimationPlayer.play("ness_dl");
		elif(relAngle == -4 or relAngle == -5):
			$AnimationPlayer.play("ness_forward");
		elif(relAngle == -6 or relAngle == -7):
			$AnimationPlayer.play("ness_dr");
		elif(relAngle == -8 or relAngle == 7):
			$AnimationPlayer.play("ness_r");
		elif(relAngle == 6 or relAngle == 5):
			$AnimationPlayer.play("ness_ur");
		elif(relAngle == 4 or relAngle == 3):
			$AnimationPlayer.play("ness_u");
		elif(relAngle == 2 or relAngle == 1):
			$AnimationPlayer.play("ness_ul");
		if(velocity == Vector2.ZERO):
			$AnimationPlayer.seek(1,true)
		
