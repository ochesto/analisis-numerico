#Tarea 2
#Ernesto Ulate Ramirez
#Fecha: 24/8/17

a = @(x) 0.3*x*x*x*x-0.15*x*x;
a_d = @(x) 0.3*4*x*x*x-0.15*2*x;

function resultado = diferencia_atras(
p_funcion, 
p_valor, 
p_paso)
  resultado = ((p_funcion(p_valor) -
              p_funcion(p_valor-p_paso)) /
              (p_paso));
endfunction

function resultado = diferencia_adelante(
p_funcion, 
p_valor, 
p_paso)
  resultado = ((p_funcion(p_valor+p_paso) - 
              p_funcion(p_valor)) /
              (p_paso));
endfunction

function resultado = diferencia_centrado(
p_funcion, 
p_valor, 
p_paso)
  resultado = ((p_funcion(p_valor+p_paso) - 
              p_funcion(p_valor-p_paso)) /
              (2*p_paso));
endfunction

error_total_atras = @(
p_funcion, 
p_funcion_d, 
p_valor, 
p_paso) abs((p_funcion_d(p_valor)) - 
        diferencia_atras(p_funcion, p_valor, p_paso));

error_total_adelante = @(
p_funcion, 
p_funcion_d, 
p_valor, 
p_paso) abs((p_funcion_d(p_valor)) - 
        diferencia_adelante(p_funcion, p_valor, p_paso));
              
error_total_centrado = @(
p_funcion, 
p_funcion_d, 
p_valor, 
p_paso) abs((p_funcion_d(p_valor)) - 
        diferencia_centrado(p_funcion, p_valor, p_paso));
        
function resultado = plot_decadas(
p_funcion, 
p_funcion_d, 
p_valor, 
p_calc, 
p_color)
  valores_h = [];
  valores_error = [];
  paso_inicial = 1;
  error_actual = 100;
  h = 1;
  k = 100;
  do
    valores_h(end+1) = h;
    error_esperado = (eps)/(h) + (h*h*0.1)/(6);
    error_actual = p_calc(p_funcion, p_funcion_d, p_valor, h);
    valores_error(end+1) = error_actual;
    h = (h)/(10^(1/k));
  until(h < 1e-10);
  loglog(valores_h, valores_error, p_color, "linewidth", 1);
endfunction

hold off;
plot_decadas(a, a_d, 1, error_total_adelante, 'r');
hold on;
plot_decadas(a, a_d, 1, error_total_atras, 'g');
plot_decadas(a, a_d, 1, error_total_centrado, 'b');
legend("adelante", "atras", "centrado","location", "north");

xlabel("h-i");
ylabel("Error");