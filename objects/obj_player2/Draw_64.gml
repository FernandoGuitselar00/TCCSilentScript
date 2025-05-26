// Texto do contador
var texto = "Mortes: " + string(deaths);

// Cálculo do tamanho da caixa
var w = string_width(texto);
var h = string_height(texto);

// Posição do canto superior direito
var pos_x = display_get_gui_width() - 10;
var pos_y = 10;

// Desenha a caixa preta atrás (preenchida)
draw_set_color(c_black);
draw_rectangle(pos_x - w - 4, pos_y, pos_x + 4, pos_y + h + 4, true); // <-- 'true' deixa preenchida

// Desenha o texto branco por cima
draw_set_color(c_white);
draw_set_halign(fa_right);
draw_set_valign(fa_top);
draw_text(pos_x, pos_y, texto);
