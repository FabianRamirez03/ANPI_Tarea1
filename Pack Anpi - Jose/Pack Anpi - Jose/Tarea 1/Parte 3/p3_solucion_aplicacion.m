function [xk, k, error] = p3_solucion_aplicacion(tol, iterMax)
  
   %Esta funci�n se encarga de insertar los datos del problema de ingenier�a elegido en la funci�n BFGS
   %
   %Sintaxis: p3_solucion_aplicacion(tol, iterMax)
   %
   %Par�metros Iniciales: 
   %            tol = un n�mero positivo que representa a la tolerancia para el criterio: ||gradiente(f(x_k))|| <= tol
   %            iterMax = cantidad de iteraciones m�ximas
   %   
   %Par�metros de Salida:                           
   %            xk = aproximaci�n de los valores de convergencia de la funci�n f
   %            k = n�mero de iteraciones realizados
   %            error = ||gradiente(f(x_k))||
   
   %Se inserta la ecuaci�n del problema de ingenier�a seleccionado en el metodo bfgs realizado en el archivo p3_bfgs.m
   
   [xk, k, error] = p3_bfgs('(x + 1.7*y)*sin(x) - 1.5*z - 0.1*m*cos(m+n-x) + 0.2*(n**2) - y - 1', ['x' 'y' 'z' 'm' 'n'], 10**-5, 50) #Dolan Function
   
   %[xk, k, error] = p3_bfgs('((800*x / (8*x + 8*22) + 10*x + 120)) * 2) / x - y)', ['x' 'y'], 10**-5, 100) #M�xima transferencia de potencia
   
end
