from sympy import sympify, symbols
from sympy import Symbol
from sympy import diff
from sympy import solve
import math

x, y = symbols('x y')

def newton_H_m1(fun, x0, tol, iterMax):

    """
    Esta función aproxima la solución de la función f(x)=0, utilizando el método de Newton Raphson.
    
    Sintaxis: newton_H_m1(fun, x0, tol, iterMax)
    
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

    if (tol <= 0):
        
        print ("El valor de la tolerancia no es valido")
        return False
    
    else:

        func = sympify(fun)
        dfunc = diff(func, x)

        k = 0
        error = tol + 1
        e = []

        result = [0, 0, 0]

        while (error > tol and k < iterMax):
            k += 1
            result [1] = k
            value = abs(func.subs({'x' : x0}).evalf())
            print (value)
            if (value < tol):
                break

            else:
                valfunc = func.subs({'x' : x0}).evalf()
                valdfunc = dfunc.subs({'x' : x0}).evalf()
                xk = x0 - (valfunc/valdfunc)
                result[0] = xk

                val_func_xk = func.subs({'x' : xk}).evalf()
                error = abs(val_func_xk)
                result [2] = error
                x0 = xk
        print ("Método: newton_H_m1 ")
        print ("Aproximación del cero: ", result[0])
        print ("Error: ", result [2])
        print ("Iteraciones: ", result [1])
        print (" ")

#help(newton_H_m1)

def newton_H_m2(fun, x0, tol, iterMax, B):

    """
    Esta función aproxima la solución de la función f(x)=0, utilizando el método de Newton Raphson.
    
    Sintaxis: newton_H_m2(fun, x0, tol, iterMax)
    
    Parámetros Iniciales: 
                fun = es un string que representa a la función f
                x0 = es el valor inicial de la iteración, este sera el primer valor evaluado.
                tol = un número positivo que representa a la tolerancia para el criterio ||f(xk)|| < tol
                iterMax = cantidad de iteraciones máximas
                B = un parámetro para la función de peso
                
    Parámetros de Salida: 
                xk = aproximación del cero de la función f
                k = número de iteraciones realizados
                error = |f(x)|
                
    """ 

    if (tol <= 0):
        
        print ("El valor de la tolerancia no es valido")
        return False
    
    else:

        func = sympify(fun)
        dfunc = diff(func, x)

        k = 0
        error = tol + 1
        e = []

        result = [0,0,0]

        while (error > tol and k < iterMax):
            k += 1
            result[1] = k
            value = abs(func.subs({'x' : x0}).evalf())

            if (value < tol):
                break

            else:
                valfunc = func.subs({'x' : x0}).evalf()
                valdfunc = dfunc.subs({'x' : x0}).evalf()

                u = valfunc / valdfunc
                hfunc = 1 / (1 + B*u) #Función de peso
                xk = x0 - hfunc*(valfunc/valdfunc)
                result[0] = xk

                val_func_xk = func.subs({'x' : xk}).evalf()
                error = abs(val_func_xk)
                result[2] = error
                x0 = xk
                
        print ("Método: newton_H_m2 ")
        print ("Aproximación del cero: ", result[0])
        print ("Error: ", result [2])
        print ("Iteraciones: ", result [1])
        print (" ")

#help(newton_H_m2)

def newton_G_m1(fun, x0, tol, iterMax):

    """
    Esta función aproxima la solución de la función f(x)=0, utilizando el método de Newton Raphson.
    
    Sintaxis: newton_G_m1(fun, x0, tol, iterMax)
    
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

    if (tol <= 0):
        
        print ("El valor de la tolerancia no es valido")
        return False
    
    else:

        func = sympify(fun)
        dfunc = diff(func, x)
        ddfunc = diff(dfunc, x)

        k = 0
        error = tol + 1
        e = []
        result = [0,0,0]

        while (error > tol and k < iterMax):
            k += 1
            result[1] = k
            value = abs(func.subs({'x' : x0}).evalf())
      
            if (value < tol):
                break

            else:
                valfunc = func.subs({'x' : x0}).evalf()
                valdfunc = dfunc.subs({'x' : x0}).evalf()
                valddfunc = ddfunc.subs({'x' : x0}).evalf()

                w = (valfunc * valddfunc) / (valdfunc**2)
                gfunc = 2 / (2 - w) #Función de peso
                xk = x0 - gfunc*(valfunc/valdfunc)
                result[0] = xk

                val_func_xk = func.subs({'x' : xk}).evalf()
                error = abs(val_func_xk)
                result[2] = error
                x0 = xk
                
        print ("Método: newton_G_m1 ")
        print ("Aproximación del cero: ", result[0])
        print ("Error: ", result [2])
        print ("Iteraciones: ", result [1])
        print (" ")

#help(newton_G_m1)

def newton_G_m2(fun, x0, tol, iterMax):

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

    if (tol <= 0):
        
        print ("El valor de la tolerancia no es valido")
        return False
    
    else:

        func = sympify(fun)
        dfunc = diff(func, x)
        ddfunc = diff(dfunc, x)

        k = 0
        error = tol + 1
        e = []
        result = [0,0,0]

        while (error > tol and k < iterMax):
            k += 1
            result [1] = k
            value = abs(func.subs({'x' : x0}).evalf())
            
            if (value < tol):
                break

            else:
                valfunc = func.subs({'x' : x0}).evalf()
                valdfunc = dfunc.subs({'x' : x0}).evalf()
                valddfunc = ddfunc.subs({'x' : x0}).evalf()

                w = (valfunc * valddfunc) / (valdfunc**2)
                gfunc = (w - 2) / (2 * (w - 1)) #Función de peso
                xk = x0 - gfunc*(valfunc/valdfunc)
                result[0] = xk

                val_func_xk = func.subs({'x' : xk}).evalf()
                error = abs(val_func_xk)
                result[2] = error
                x0 = xk
                
        print ("Método: newton_G_m2 ")
        print ("Aproximación del cero: ", result[0])
        print ("Error: ", result[2])
        print ("Iteraciones: ", result[1])
        print (" ")

#help(newton_G_m2)

#newton_H_m1('sin(x)*sin(x) - x**2 + 1', 1, 10**-5, 500)
#newton_H_m2('-cos(x)+x**2', 5, 10**-8, 50, 0)
#newton_G_m1('-cos(x)+x**2', 5, 10**-8, 50)
#newton_G_m2('-cos(x)+x**2', 5, 10**-8, 50)


