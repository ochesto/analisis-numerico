#Tarea 2 - Metodos de derivacion aproximados
#Por: Ernesto Ulate Ramirez
#Fecha: 24/8/17
output_precision(15);

# f(x) indicada para calcular la derivada
global f = @(x) 0.3*x*x*x*x-0.15*x*x;

# f'(x) de forma analitica
global f_d = @(x) 0.3*4*x*x*x-0.15*2*x; 

#Aproximacion de diferencia hacia atras
global diferencia_atras = @(
p_funcion,            #Funcion a derivar
p_valor_a_evaluar,    #Valor a evaluar
p_paso_incremento) (  #Tamano del paso o incremento
         (p_funcion(p_valor_a_evaluar) -
          p_funcion(p_valor_a_evaluar-p_paso_incremento)) /
         (p_paso_incremento));

#Aproximacion de diferencia hacia adelante
global diferencia_adelante = @(
p_funcion,            #Funcion a derivar
p_valor_a_evaluar,    #Valor a evaluar
p_paso_incremento) (  #Tamano de paso o incremento
         (p_funcion(p_valor_a_evaluar+p_paso_incremento) - 
          p_funcion(p_valor_a_evaluar)) /
         (p_paso_incremento));

#Aproximacion de diferencia centrada
global diferencia_centrada = @(
p_funcion,            #Funcion a derivar
p_valor_a_evaluar,    #Valor a evaluar    
p_paso_incremento) (  #Tamano de paso o incremento            
         (p_funcion(p_valor_a_evaluar+p_paso_incremento) - 
          p_funcion(p_valor_a_evaluar-p_paso_incremento)) /
         (2*p_paso_incremento));

#Calculo del error total en derivada aproximada
function resultado = error_total(
p_funcion,                    #Funcion a derivar
p_funcion_derivada_analitica, #Funcion derivada analiticamente
p_metodo_derivacion,          #Metodo de derivacion (atras, adelante, centrada)
p_valor_a_evaluar,            #Valor a evaluar
p_paso_incremento)            #Tamano de paso o incremento
  resultado = abs((p_funcion_derivada_analitica(p_valor_a_evaluar)) - 
        p_metodo_derivacion(p_funcion, p_valor_a_evaluar, p_paso_incremento));
endfunction
        
function resultado = plot_error(
p_funcion,                    #Funcion a derivar
p_funcion_analitica,          #Funcion derivada analiticamente
p_metodo_derivacion,          #Metodo de derivacion (atras, adelante, centrada)
p_valor_a_evaluar,            #Valor a evaluar
p_color_plot)                 #Color de linea para el plot
  _valores_h = [];        #Vector con los valores de incremento
  _valores_error = [];    #Vector con los errores totales calculados
  _h = 1;                 #Tamano de paso o incremento. Inicia en 1.
  _k = 100;               #Muestras por decada del plot
  _epsilon_maquina = eps; #Epsilon del procesador
  do
    #Almacena el tamano de paso
    _valores_h(end+1) = _h; 
    
    #Calculo error total
    _error_actual = error_total(p_funcion, 
                                p_funcion_analitica, 
                                p_metodo_derivacion, 
                                p_valor_a_evaluar, 
                                _h);
    #Almacena el error total obtenido con el tamano de paso actual                                
    _valores_error(end+1) = _error_actual;
    
    #Actualizacion del tamano de paso
    _h = (_h)/(10^(1/_k));
  until(_h < 1e-10);  #Loop hasta que el tamano de paso sea mayor a 1e-10
  
  #Pinta el plot de los datos en pantalla
  loglog(_valores_h, _valores_error, p_color_plot, "linewidth", 1);
  
  #Nombre de los ejes
  xlabel("h_i");
  ylabel("Error(h_i)");
endfunction

#Funcion Main con el menu principal
function resultado = main(f, f_d, m1, m2, m3)
  disp("");
  disp("Tarea 2: Metodos de derivacion aproximados.");
  disp("Por: Ernesto Ulate Ramirez.");
  disp("Fecha: 24/8/17");
  disp("");
  disp("Se va aproximar la derivada de:");
  disp(" f(x) = 0.3*x^4 - 0.15*x^2.");
  disp("Mediante el metodo:");
  disp("  1) Diferencias hacia atras.");
  disp("  2) Diferencias hacia adelante.");
  disp("  3) Diferencias centradas.");
  disp("  4) Todos los anteriores.");
  disp("  5) Salir.");
  
  #Verifica que el dato ingresado por el usuario sea valido
  try
    metodo = input("Seleccione una opcion: ");
    if (metodo == 1)  #Diferencias hacia atras
      plot_error(f, f_d, m1, 1, 'g');
      legend("atras","location", "north"); 
      main(f, f_d, m1, m2, m3);
    endif
    if (metodo == 2)  #Diferencias hacia adelante
      plot_error(f, f_d, m2, 1, 'r');
      legend("adelante","location", "north"); 
      main(f, f_d, m1, m2, m3);
    endif
    if (metodo == 3)  #Diferencias centradas
      plot_error(f, f_d, m3, 1, 'b'); 
      legend("centrado","location", "north");
      main(f, f_d, m1, m2, m3);
    endif
    if (metodo == 4)  #Todas las anteriores
      hold off;
      plot_error(f, f_d, m2, 1, 'r');
      hold on;
      plot_error(f, f_d, m1, 1, 'g');
      plot_error(f, f_d, m3, 1, 'b');
      legend("adelante", "atras", "centrado","location", "north"); 
      main(f, f_d, m1, m2, m3);
    endif
    if (metodo == 5)  #SALIR del programa
      disp("SALIR.");
      return; 
    endif
    if (metodo > 5) #Opcion no existente
      disp("!!!!!");
      disp("Opcion no existente. Intente de nuevo.");
      main(f, f_d, m1, m2, m3); 
    endif
  catch
  disp("!!!!!!"); #Opcion no existente
  disp("Utilice unicamente las opciones disponibles. Intente de nuevo.");
  main(f, f_d, m1, m2, m3);
  end_try_catch
endfunction

#Llamada al menu principal
main(f, f_d, diferencia_atras, diferencia_adelante, diferencia_centrada);