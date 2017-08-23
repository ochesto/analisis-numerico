#Ernesto Ulate Ramirez

#Variables globales
n = 0;
x = 0;

#Realizar el calculo
function resultado = aproximar(n, x)
  #Establece las variables
  scarborough = 0.5 * 10^(2-n);
  numero_terminos = 1;
  valor_estimado = 0;
  valor_verdadero = exp(x);
  error_relativo_verdadero = 0;
  error_relativo_aproximado = 0;
  
  #While hasta que se complete la serie
  #de Taylor con los terminos necesarios.
  do
  valor_estimado = taylor(x, numero_terminos);
  error_relativo_aproximado = ((x^(numero_terminos))/(factorial(numero_terminos)*valor_estimado))*100;
  numero_terminos = numero_terminos + 1;
  until(error_relativo_aproximado < scarborough); #Terminos suficientes

  #Calcula error relatico verdadero
  error_relativo_verdadero = (abs(1-(valor_estimado/valor_verdadero)))*100;
  
  output_precision(n+1)
  #Muestra de resultados obtenidos
  disp('valor_estimado: ')
  disp(valor_estimado);
  disp('')
  disp('valor_verdadero: ')
  disp(valor_verdadero);
  disp('')
  disp('error_relativo_verdadero: ')
  disp(error_relativo_verdadero);
  disp('')
  disp('error_relativo_aproximado: ')
  disp(error_relativo_aproximado);
  disp('')
  disp('numero_terminos: ')
  disp(numero_terminos);
  disp('------------------------------')
  
endfunction

#Calculo de serie de Taylor
function suma_taylor = taylor(variable, limite)
  if(limite == 0);
    suma_taylor = 0;
    return;
  else
    suma_taylor = taylor(variable, limite - 1) + variable^(limite-1)/factorial(limite-1);
  endif
endfunction

#Calculo de factorial
function respuesta = factorial(numero);
  if(numero < 0);
    error('Invalido para numeros negativos')
  endif
  respuesta = 1;
  if(numero == 0);
    return;
  else
    for i=2:numero;
      respuesta = respuesta * i;
    endfor
  endif
endfunction

#Comprueba datos ingresados por el usuario
function comprobado = compruebaDatos(n, x)
  if(mod(n,1) != 0)
    disp('Cantidad de n significativas no entera.')
    comprobado = false;
    return;
  endif
  if(!isreal(x) | x>100)
    disp('Valor real no pertenece a los numeros reales o es mayor que 100.')
    comprobado = false;
    return;
  endif
  disp('n: ')
  disp(n)
  disp('x : ')
  disp(x)
  comprobado = true;
  return;
endfunction

#Comprueba los datos ingresados y ejecuta programa
function resultado = aproximarExponencial(n, x)
  if(compruebaDatos(n, x))
    aproximar(n, x);
   endif
 endfunction
 
n = 3;
x = 0.5;
#Inicializa el programa
aproximarExponencial(n, x)

n = 10;
x = 2.7;
#Inicializa el programa
aproximarExponencial(n, x)

