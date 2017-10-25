%Tarea 5 - Soluciones de ecuaciones diferenciales ordinarias
%Por: Ernesto Ulate Ramirez
%Fecha: 24/10/17
pkg load odepkg; %Paquete odepkg
output_precision(15);

%Funcion Runge-Kutta 4
function [x,y] = rungekutta4( f, xi, xf, y0, h )
  x = xi:h:xf;
  y = zeros(1,length(x)); 
  y(1) = y0;
  
  for i=1:(length(x)-1)
    _k1 = f(x(i),y(i));
    _k2 = f(x(i)+0.5*h, y(i)+0.5*_k1*h);
    _k3 = f(x(i)+0.5*h, y(i)+0.5*_k2*h);
    _k4 = f(x(i)+h, y(i)+_k3*h);
    y(i+1) = y(i) + (1/6)*(_k1 + 2*_k2 + 2*_k3 + _k4)*h;
   endfor
endfunction

%Grafica los datos requeridos del ejercicio 1
function graficar_rungekutta4()
  f = @(x,y) x*y*y; %EDO
  %Caracteristicas iniciales
  y0 = 1;
  xi = 0;
  xf = 1;
  valor_real_y1 = 2;
  
  %Variables locales
  h = (1/8);
  h_nums = zeros(1, 8);
  y_error = zeros(1, 8);
  pos_y_error = 1;
  
  do %Ciclo para evlauar en intervalo de h
    %Colores rgb de linea
    _r = rand(1);
    _g = rand(1);
    _b = rand(1);
    
    %Encuentra solucion de EDO con Runge-Kutta 4
    [ x,y ] = rungekutta4( f, xi, xf, y0, h );
    
    %Plot y(x) con la respuesta del Runge-Kutta 4
    figure(1);
    plot( x, y, 'Color', [_r,_g,_b]); hold on
    axis( [0.94 1 1.85 2] );
    title("Resultado y(x) para todo el intervalo");
    xlabel("x");
    ylabel("y");
    
    %Almacena valores de h y y(x_ultimo)
    h_nums(pos_y_error) = h;
    y_error(pos_y_error) = abs(y(length(y)-1) - valor_real_y1)*0.5*100;
    pos_y_error = pos_y_error + 1;
    h = h/2;
  until( h <= (1/1024) );
  
  %Plot del error con respecto a y(1)=2
  figure(2);
  plot( h_nums, y_error, 'Color', 'r' ); hold on
  title("Porcentaje de error de y(x) con respecto a h");
  xlabel("h");
  ylabel("Error (%)");
  
endfunction

%Grafica los datos requeridos del ejercicio 2
function graficar_ejercicio2()
  f = @(x,y) 100-y; %EDO
  %Caracteristicas iniciales
  y0 = 5;
  xi = 0;
  xf = 200;
  pasos_deseados = 1000;
  h = (xf-xi)/pasos_deseados;
  
  %Variables locales
  time_ode45 = 0;
  time_ode23 = 0;
  time_rk4 = 0;
  
  tic();
  %Evaluacion con ode45
  odeset45 = odeset( "RelTol", 1e-5, "AbsTol", realmin, 
              "InitialStep", 9.7656e-04, "MaxStep", 0.125 );
  [ t_45, y_45 ] = ode45( f, [xi,xf], y0, odeset45 );
  time_ode45 = toc();
  
  tic();
  %Evaluacion con ode23
  [ t_23, y_23 ] = ode23( f, [xi,xf], y0, odeset45 );
  time_ode23 = toc();
  
  tic();
  %Evaluacion con Runge-Kutta4
  [x_r, y_r] = rungekutta4( f, xi, xf, y0, h );
  time_rk4 = toc();
  
  %Plot comparacion metodos ode45, ode23, runge-kuttta 4
  p = figure(3);
  plot( x_r, y_r, 'Color', 'r' ); hold on
  plot( t_45, y_45, 'Color', 'b' ); hold on
  plot( t_23, y_23, 'Color', 'g' ); hold on
  axis( [8.1535 8.1555 99.9724 99.9730] );
  title("y(x) de soluciones de EDO con diferentes metodos");
  legend({"ode45","ode23","Runge-Kutta 4"});
  xlabel("x");
  ylabel("y");
  
  %Plot comparacion de tiempo ode45, ode23, runge-kutta 4
  figure(4);
  title("Time");
  times = [ time_ode45, 0, 0; 0, time_ode23, 0; 0, 0, time_rk4];
  b = bar ( times );
  legend({"ode45","ode23","Runge-Kutta 4"});
  title("Comparacion de tiempo entre metodos para solucion de EDO");
  xlabel("Method");
  ylabel("Time (s)");
  
  %Plot de puntos por metodo
  figure(5);
  title("Steps");
  steps = [ length(t_45), 0, 0; 0, length(t_23), 0; 0, 0, length(x_r)];
  s = bar ( steps );
  legend({"ode45","ode23","Runge-Kutta 4"});
  title("Cantidad de puntos evaluados por el metodo para resolver EDO");
  xlabel("Method");
  ylabel("Steps");
  
endfunction

%Inicio del programa
function tarea()
  disp("");
  disp("Tarea 5: Soluciones de ecuaciones diferenciales ordinarias.");
  disp("Por: Ernesto Ulate Ramirez.");
  disp("Fecha: 24/10/17");
  
  disp("");
  disp("  1) Ejercicio 1");
  disp("  2) Ejercicio 2");
  disp("  3) Salir");
  
  try
    metodo = input("Seleccione el ejercicio a ejecutar: ");
    if( metodo == 1 ) %Ejercicio 1
      graficar_rungekutta4();
      tarea();
    endif
    if( metodo == 2 ) %Ejercicio 2
      graficar_ejercicio2();    
      tarea();
    endif
    if( metodo == 3 ) %Salir
      return;
    endif
  catch
    disp("Opcion incorrecta. Intente de nuevo.");
    tarea();
  end_try_catch 
  
endfunction

tarea();