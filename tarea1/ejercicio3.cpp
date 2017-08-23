//Ernesto Ulate Ramirez
//Definicion de bibliotecas
#include <iostream>
#include <math.h>
using namespace std;

//Clase template para el calculo con floats y doubles
template <class T>
class Ecuacion {
public:
	//Metodos principales
	T* solucionesCuadratica(T pValor_a, T pValor_b, T pValor_c);
};
//Calcula las soluciones cuadraticas
template <class T>
T* Ecuacion<T>::solucionesCuadratica(T pValor_a, T pValor_b, T pValor_c) {
	T* soluciones = new T[2];
	soluciones[0] = (-pValor_b + sqrt(pValor_b*pValor_b - 4 * pValor_a * pValor_c))/(2 * pValor_a);
	soluciones[1] = (-pValor_b - sqrt(pValor_b*pValor_b - 4 * pValor_a * pValor_c))/(2 * pValor_a);
	return soluciones;
}

//Funcion main para inicializar los programas
int main() {

	cout << " *** Ejercicio 3 *** " << endl;

	//Intancias de clases template
	Ecuacion<double> ecuacionDouble; //Double
	Ecuacion<float> ecuacionFloat;	//Float

	//Variables doubles necesarias
	double a = 1;
	double b = 3000.001;
	double c = 3;

	//Variables float necesarias
	float af = 1;
	float bf = 3000.001;
	float cf = 3;

	//Ejecucion de metodo generico
	//Calculo de soluciones de ecuacion cuadratica
	double* soluciones_double = ecuacionDouble.solucionesCuadratica(a, b, c);
	float* soluciones_float = ecuacionFloat.solucionesCuadratica(af, bf, cf); 

	//Imprime los resultados obtenidos
	cout << "Double x1: ";
	cout << soluciones_double[0] << endl;

	cout << "Double x2: ";
	cout << soluciones_double[1] << endl << endl;

	cout << "Float x1: ";
	cout << soluciones_float[0] << endl;

	cout << "Float x2: ";
	cout << soluciones_float[1] << endl;

	//Ejecucion finalizada y correcta
	return 0;
}