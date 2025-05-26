#region MOVIMENTAÇÃO

move = +keyboard_check(vk_right)-keyboard_check(vk_left)

hsp=move*spd

#endregion

#region COLISÃO

//HORIZONTAL
if place_meeting(x+hsp,y,obj_test_block)
{	
	while !place_meeting(x+sign(hsp),y,obj_test_block)
	{
		x+=sign(hsp)
	}
	hsp=0
}
x+=hsp

//VERTICAL
if place_meeting(x,y+vsp,obj_test_block)//Se tocar no bloco
{	
	while !place_meeting(x,y+sign(vsp),obj_test_block)//Enquanto não tocar no bloco 
	{
		y+=sign(vsp)//Define a velocidade, esse sign faz qualquer coisa virar 0 ou 1
	}
	vsp=0
}
y+=vsp

#endregion

#region PULOS

if place_meeting(x,y+1,obj_test_block)
{
	jumps=1
}
else
{
	vsp+=grav
}
 
if keyboard_check_pressed(vk_up) && jumps>0
{
	vsp=jspd
	jumps-=1
}


#endregion

#region TELEPORTE

if place_meeting(x,y,obj_test_door)
{
	x = 255	y = 160
}

#endregion

#region MORTE

if alive=true && place_meeting(x,y,obj_player)
{
	alive=false
	deaths+=1
}

if !alive
{
	visible=false
	x=-10000 //manda para fora da tela (evita bugs)
}

if !alive && keyboard_check(vk_down)
{
	alive=true
	visible=true
	x=x_original
	y=y_original
}

#endregion