#include <iostream>
#include <iomanip>
#include <stdlib.h>

using namespace std;

template <class T>
class Calculo {
public:
	T sumatoria(T pNumero1, T pNumero2);
	T valorReal(T pNumero1, T pNumero2);
};

template <class T>
T Calculo<T>::sumatoria(T pNumero1, T pNumero2) {
	T resultado = 0;
	for (int i=0; i < pNumero1; i++) {
	resultado += pNumero2 ;
	}
	return resultado;
}

template <class T>
T Calculo<T>::valorReal(T pNumero1, T pNumero2) {
	T resultado = 0;
	resultado = pNumero1 * pNumero2;
	return resultado;
}

int main() {
	
	cout << " *** Ejercicio 2 *** " << endl;
	
	double n1 = 100000000.0;
	double n2 = 0.00001;
	double resultadoSumatoria = 0.0;
	double resultadoReal = 0.0;
	
	Calculo<double> calc;
	resultadoSumatoria = calc.sumatoria(n1, n2);
	resultadoReal = calc.valorReal(n1, n2);

	cout << "** Valores DOUBLE **" << endl;
	cout << fixed;
	cout << "Resultado esperado: ";	
	cout << setprecision(10) << resultadoReal << endl;
	cout << "Resultado obtenido por sumatoria: ";
	cout << setprecision(10) << resultadoSumatoria << endl << endl;

	float n1f = 100000000.0;
	float n2f = 0.00001;
	float resultadoSumatoriaf = 0.0;
	float resultadoRealf = 0.0;
	
	Calculo<float> calcf;
	resultadoSumatoriaf = calcf.sumatoria(n1f, n2f);
	resultadoRealf = calcf.valorReal(n1f, n2f);

	cout << "** Valores FLOAT **" << endl;
	cout << fixed;
	cout << "Resultado esperado: ";	
	cout << setprecision(10) << resultadoRealf << endl;
	cout << "Resultado obtenido por sumatoria: ";
	cout << setprecision(10) << resultadoSumatoriaf << endl;

	return 0;
}