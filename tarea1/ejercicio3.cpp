#include <iostream>
#include <math.h>
using namespace std;

template <class T>
class Ecuacion {
public:
	T* solucionesCuadratica(T pValor_a, T pValor_b, T pValor_c);
};
template <class T>
T* Ecuacion<T>::solucionesCuadratica(T pValor_a, T pValor_b, T pValor_c) {
	T* soluciones = new T[2];
	soluciones[0] = (-pValor_b + sqrt(pValor_b*pValor_b - 4 * pValor_a * pValor_c))/(2 * pValor_a);
	soluciones[1] = (-pValor_b - sqrt(pValor_b*pValor_b - 4 * pValor_a * pValor_c))/(2 * pValor_a);
	return soluciones;
}

int main() {

	cout << " *** Ejercicio 3 *** " << endl;

	Ecuacion<double> ecuacionDouble;
	Ecuacion<float> ecuacionFloat;

	double a = 1;
	double b = 3000.001;
	double c = 3;

	float af = 1;
	float bf = 3000.001;
	float cf = 3;

	double* soluciones_double = ecuacionDouble.solucionesCuadratica(a, b, c);
	float* soluciones_float = ecuacionFloat.solucionesCuadratica(af, bf, cf); 

	cout << "Double x1: ";
	cout << soluciones_double[0] << endl;

	cout << "Double x2: ";
	cout << soluciones_double[1] << endl << endl;

	cout << "Float x1: ";
	cout << soluciones_float[0] << endl;

	cout << "Float x2: ";
	cout << soluciones_float[1] << endl;

	return 0;
}