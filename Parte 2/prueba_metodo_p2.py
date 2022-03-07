from metodos_p2 import *

def prueba_metodos (fun: str, x0: float, tol: float, iterMax: int, beta: int):

    print ("Función a la cual se desea calcular el cero: ", fun)
    print ("Resultados:")
    print (" ")
    
    newton_H_m1(fun, x0, tol, iterMax)

    newton_H_m2(fun, x0, tol, iterMax, beta)

    newton_G_m1(fun, x0, tol, iterMax)

    newton_G_m2(fun, x0, tol, iterMax)

prueba_metodos ('sin(x)**2 - x**2 + 1', 2.5, 10**-5, 500, 5)
