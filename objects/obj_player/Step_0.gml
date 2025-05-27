#region MOVIMENTAÇÃO

move=0
if keyboard_check(ord("A")) move=-1
if keyboard_check(ord("D")) move=1

hsp=move*move_speed

#endregion

#region PULO E GRAVIDADE

if keyboard_check_pressed(ord("W")) && is_grounded
{
	vsp = jump_speed
	is_grounded=false
}

vsp+=grav

if (move !=0)
{
	image_xscale=move
}

if place_meeting(x-1,y+1,obj_test_block) || place_meeting(x+1,y+1,obj_test_block)
{
	is_grounded=true
}



#endregion

#region COLISÃO

if place_meeting(x+hsp,y,obj_test_block)
{
	while !place_meeting(x+sign(hsp),y,obj_test_block){
		x+=sign(hsp)
	}
	hsp=0
}
x += hsp


on_ground=false
if place_meeting(x,y+vsp,obj_test_block)
{
	while !place_meeting(x,y+sign(vsp),obj_test_block){
		y+=sign(vsp)
	}
	vsp=0
	
	//Verifica se o personagem está no chão
	if sign(vsp)>=0
	{
		on_ground=true	
	}
}
y += vsp
is_grounded=on_ground


#endregion

#region TELEPORTE

if place_meeting(x,y,obj_test_door)
{
	x = 255	y = 160
}

#endregion

#region ANIMAÇÕES

if !is_grounded{
	sprite_index=spr_jump
}else if hsp!=0{
	sprite_index=spr_run
}else{
	sprite_index=spr_idle
}

#endregion