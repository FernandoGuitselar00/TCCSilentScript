#region MOVIMENTAÇÃO

move = +keyboard_check(ord("D"))-keyboard_check(ord("A"))

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
 
if keyboard_check_pressed(ord("W")) && jumps>0
{
	vsp=jspd
	jumps-=1
}


#endregion