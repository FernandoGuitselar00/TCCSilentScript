if appearing
{
	image_alpha+=0.05//Define a velociade que a imagem aparece
	
	if image_alpha>=1{//Quando ela estiver completamente visivel ela some
		appearing=false//Deixa invisivel
	}
}
else
{
	image_alpha-=0.02//Some aos poucos
	if image_alpha<=0
	{
		instance_destroy()//Remove o efeito quando estiver totalmente visivel
	}
}