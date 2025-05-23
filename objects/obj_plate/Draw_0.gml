draw_self(); // desenha a sprite da placa normalmente

if (show) {
    var texto = mesage;
    
    // Define a posição da caixa e texto
    var texto_x = x;
    var texto_y = y - 60;
    
    // Calcula largura e altura do texto
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    var largura = string_width(texto);
    var altura = string_height(texto);

    // Desenha a caixa atrás do texto com margem
    var margem = 4;
    draw_set_color(c_black);
    draw_set_alpha(0.75);
    draw_rectangle(texto_x - largura/2 - margem, texto_y - margem,
                   texto_x + largura/2 + margem, texto_y + altura + margem, false);

    // Desenha o texto centralizado
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    draw_text(texto_x, texto_y, texto);
}
