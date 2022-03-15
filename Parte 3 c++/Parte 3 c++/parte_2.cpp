// parte_2.cpp : Este archivo contiene la función "main". La ejecución del programa comienza y termina ahí.
//

#include <iostream>

double fn(double x)
{
    return pow(sin(x), 2) - pow(x, 2) + 1;
}

double de(double x)
{
    return 2*sin(x)*cos(x)-2*x; 
}

double dde(double x)
{
    return -4* pow(sin(x), 2);
}

void newton_H_m1(float x0, double tol, int interMax)
{
    /*
    """
        Esta función aproxima la solución de la función f(x) = 0, utilizando el método de Newton Raphson.

        Sintaxis: newton_H_m1(fun, x0, tol, iterMax)

        Parámetros Iniciales :
    fun = que representa a la función f
        x0 = es el valor inicial de la iteración
        tol = un número positivo que representa a la tolerancia para el criterio || f(xk) || < tol
        iterMax = cantidad de iteraciones máximas

        Parámetros de Salida :
    xk = aproximación del cero de la función f
        k = número de iteraciones realizados
        error = | f(x) |

        """ */
    if (tol <= 0) {
        std::cout << "El valor de la tolerancia no es valido\n";
    }
    else
    {
        int k = 0;
        double error = tol + 1;
        double resultado0 = 0;
        double resultado1 = 0;
        double resultado2 = 0;

        double valfunc = 0;
        double valdfun = 0;
        double xk = 0;
        double val_func_xk = 0;
        while (error > tol || k < interMax)
        {
            k++;
            resultado1 = k;
            double value = abs(fn(x0));
            //std::cout << value<< "\n" << std::endl;


            if (value < tol)
            {
                break;
            }
            else
            {
                valfunc = fn(x0);
                valdfun = de(x0);
                xk = x0 - (valfunc / valdfun);
                resultado0 = xk;
                val_func_xk = fn(xk);
                error = abs(val_func_xk);
                resultado2 = error;
                //std::cout << resultado2 << "\n" << std::endl;
                x0 = xk;
                
            }
        }
        valfunc = fn(x0);
        valdfun = de(x0);
        xk = x0 - (valfunc / valdfun);
        resultado0 = xk;
        val_func_xk = fn(xk);
        error = abs(val_func_xk);
        resultado2 = error;
        //std::cout << resultado2 << "\n" << std::endl;
        x0 = xk;

        std::cout << "Metodo: newton_H_m1 \n";
        std::cout << "Aproximacion del cero:  " << resultado0 << "\n" << std::endl;
        std::cout << "Error:  " << resultado2 << "\n" << std::endl;
        std::cout << "Iteraciones:  " << resultado1 << "\n" << std::endl;
        std::cout << " \n";
    }
}

void newton_H_m2(float x0, double tol, int interMax, int B)
{
    /*
    """
        Esta función aproxima la solución de la función f(x) = 0, utilizando el método de Newton Raphson.

        Sintaxis: newton_H_m2(fun, x0, tol, iterMax)

        Parámetros Iniciales :
    fun = representa a la función f
        x0 = es el valor inicial de la iteración
        tol = un número positivo que representa a la tolerancia para el criterio || f(xk) || < tol
        iterMax = cantidad de iteraciones máximas
        B = un parámetro para la función de peso

        Parámetros de Salida :
    xk = aproximación del cero de la función f
        k = número de iteraciones realizados
        error = | f(x) |

        """ */

    if (tol <= 0) {
        std::cout << "El valor de la tolerancia no es valido\n";
    }
    else
    {
        int k = 0;
        double error = tol + 1;
        double resultado0 = 0;
        double resultado1 = 0;
        double resultado2 = 0;

        double valfunc = 0;
        double valdfun = 0;
        double u = 0;
        double hfunc = 0;
        double xk = 0;
        double val_func_xk =0;
        while (error > tol || k < interMax)
        {
            
            double value = abs(fn(x0));
            //std::cout << value<< "\n" << std::endl;
            if (value < tol)
            {
                break;
            }
            else
            {
                valfunc = fn(x0);
                valdfun = de(x0);
                u = valfunc / valdfun;
                hfunc = 1 / (1 + B * u);
                xk = x0 - hfunc*u;
                resultado0 = xk;
                val_func_xk = fn(xk);
                error = abs(val_func_xk);
                resultado2 = error;
                //std::cout << resultado2 << "\n" << std::endl;
                k++;
                resultado1 = k;
                x0 = xk;

            }
        }
        

        std::cout << "Metodo: newton_H_m2 \n";
        std::cout << "Aproximacion del cero:  " << resultado0 << "\n" << std::endl;
        std::cout << "Error:  " << resultado2 << "\n" << std::endl;
        std::cout << "Iteraciones:  " << resultado1 << "\n" << std::endl;
        std::cout << " \n";
    }

}
void newton_G_m1(float x0, double tol, int interMax)
{
    /*
    """
    Esta función aproxima la solución de la función f(x)=0, utilizando el método de Newton Raphson.
    
    Sintaxis: newton_G_m1(fun, x0, tol, iterMax)
    
    Parámetros Iniciales: 
                fun = es un string que representa a la función f
                x0 = es el valor inicial de la iteración
                tol = un número positivo que representa a la tolerancia para el criterio ||f(xk)|| < tol
                iterMax = cantidad de iteraciones máximas
                
    Parámetros de Salida: 
                xk = aproximación del cero de la función f
                k = número de iteraciones realizados
                error = |f(x)|
                
    """ 
    */

    if (tol <= 0) {
        std::cout << "El valor de la tolerancia no es valido\n";
    }
    else
    {
        int k = 0;
        double error = tol + 1;
        double resultado0 = 0;
        double resultado1 = 0;
        double resultado2 = 0;

        double valfunc = 0;
        double valdfunc = 0;
        double valddfunc = 0;
        double u = 0;
        double gfunc =0;
        double xk = 0;
        double val_func_xk =0;
        while (error > tol || k < interMax)
        {
            
            double value = abs(fn(x0));
            //std::cout << value<< "\n" << std::endl;
            if (value < tol)
            {
                break;
            }
            else
            {
                valfunc = fn(x0);
                valdfunc = de(x0);
                valddfunc = dde(x0);
                u = (valfunc * valddfunc) / (valdfunc* valdfunc);
                gfunc = 2 / (2 - u);
                xk = x0 - gfunc * (valfunc / valdfunc);
                resultado0 = xk;
                val_func_xk = fn(xk);
                error = abs(val_func_xk);
                resultado2 = error;
                //std::cout << resultado2 << "\n" << std::endl;
                k++;
                resultado1 = k;
                x0 = xk;

            }
        }
        

        std::cout << "Metodo: newton_G_m1 \n";
        std::cout << "Aproximacion del cero:  " << resultado0 << "\n" << std::endl;
        std::cout << "Error:  " << resultado2 << "\n" << std::endl;
        std::cout << "Iteraciones:  " << resultado1 << "\n" << std::endl;
        std::cout << " \n";
    }



}
void newton_G_m2(float x0, double tol, int interMax)
{
    /*
    """
    Esta función aproxima la solución de la función f(x)=0, utilizando el método de Newton Raphson.
    
    Sintaxis: newton_G_m2(fun, x0, tol, iterMax)
    
    Parámetros Iniciales: 
                fun = es un string que representa a la función f
                x0 = es el valor inicial de la iteración, este sera el primer valor evaluado.
                tol = un número positivo que representa a la tolerancia para el criterio ||f(xk)|| < tol
                iterMax = cantidad de iteraciones máximas
                
    Parámetros de Salida: 
                xk = aproximación del cero de la función f
                k = número de iteraciones realizados
                error = |f(x)|
                
    """ 

    */

    if (tol <= 0) {
        std::cout << "El valor de la tolerancia no es valido\n";
    }
    else
    {
        int k = 0;
        double error = tol + 1;
        double resultado0 = 0;
        double resultado1 = 0;
        double resultado2 = 0;

        double valfunc = 0;
        double valdfunc = 0;
        double valddfunc = 0;
        double u = 0;
        double gfunc = 0;
        double xk = 0;
        double val_func_xk = 0;
        while (error > tol || k < interMax)
        {
            
            double value = abs(fn(x0));
            //std::cout << value<< "\n" << std::endl;
            if (value < tol)
            {
                break;
            }
            else
            {
                valfunc = fn(x0);
                valdfunc = de(x0);
                valddfunc = dde(x0);
                u = (valfunc * valddfunc) / (valdfunc * valdfunc);
                gfunc = (u-2) / (2*(u-1));
                xk = x0 - gfunc * (valfunc / valdfunc);
                resultado0 = xk;
                val_func_xk = fn(xk);
                error = abs(val_func_xk);
                resultado2 = error;
                //std::cout << resultado2 << "\n" << std::endl;
                k++;
                resultado1 = k;
                x0 = xk;

            }
        }
        std::cout << "Metodo: newton_G_m2 \n";
        std::cout << "Aproximacion del cero:  " << resultado0 << "\n" << std::endl;
        std::cout << "Error:  " << resultado2 << "\n" << std::endl;
        std::cout << "Iteraciones:  " << resultado1 << "\n" << std::endl;
        std::cout << " \n";
    }

}

int main()
{
    std::cout << "Parte 3\n";
    newton_H_m1(2.5, 0.0001, 500);
    newton_H_m2(2.5, 0.0001, 500,5);
    newton_G_m1(2.5, 0.0001, 500);
    newton_G_m2(2.5, 0.0001, 500);
}
