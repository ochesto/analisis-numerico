//Ernesto Ulate Ramirez
//Definicion de bibliotecas
#include <iostream>
#include <iomanip>
#include <stdlib.h>

using namespace std;

//Clase template para el calculo con floats y doubles
template <class T>
class Calculo {
public:
	//Metodos principales
	T sumatoria(T pNumero1, T pNumero2);
	T valorReal(T pNumero1, T pNumero2);
};

//Calcula la sumatoria del pNumero2 hasta pNumero1
template <class T>
T Calculo<T>::sumatoria(T pNumero1, T pNumero2) {
	T resultado = 0;
	for (int i=0; i < pNumero1; i++) {
	resultado += pNumero2 ;
	}
	return resultado;
}

//Calcula el valor real mediate multiplicacion
template <class T>
T Calculo<T>::valorReal(T pNumero1, T pNumero2) {
	T resultado = 0;
	resultado = pNumero1 * pNumero2;
	return resultado;
}

//Funcion main para inicializar los programas
int main() {
	
	cout << " *** Ejercicio 2 *** " << endl;
	
	//Definen variables double para pruebas
	double n1 = 100000000.0;
	double n2 = 0.00001;
	double resultadoSumatoria = 0.0;
	double resultadoReal = 0.0;
	
	//Clase template instanciada double
	Calculo<double> calc;
	//Ejecucion de metodos de sumatoria y valor real
	resultadoSumatoria = calc.sumatoria(n1, n2);
	resultadoReal = calc.valorReal(n1, n2);

	//Imprime resultados obtenidos
	cout << "** Valores DOUBLE **" << endl;
	cout << fixed;
	cout << "Resultado esperado: ";	
	cout << setprecision(10) << resultadoReal << endl;
	cout << "Resultado obtenido por sumatoria: ";
	cout << setprecision(10) << resultadoSumatoria << endl << endl;

	//Definicion de variables
	float n1f = 100000000.0;
	float n2f = 0.00001;
	float resultadoSumatoriaf = 0.0;
	float resultadoRealf = 0.0;
	
	//Clase template instanciada float
	Calculo<float> calcf;
	//Ejecucion de metodos de sumatoria y valor real
	resultadoSumatoriaf = calcf.sumatoria(n1f, n2f);
	resultadoRealf = calcf.valorReal(n1f, n2f);

	//Imprime los resultados obtenidos
	cout << "** Valores FLOAT **" << endl;
	cout << fixed;
	cout << "Resultado esperado: ";	
	cout << setprecision(10) << resultadoRealf << endl;
	cout << "Resultado obtenido por sumatoria: ";
	cout << setprecision(10) << resultadoSumatoriaf << endl;

	//Ejecucion finalizada y correcta
	return 0;
}