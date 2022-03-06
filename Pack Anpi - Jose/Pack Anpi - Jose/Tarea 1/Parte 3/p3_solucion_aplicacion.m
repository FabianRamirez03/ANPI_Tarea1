function [xk, k, error] = p3_solucion_aplicacion(tol, iterMax)
  
   %Esta función se encarga de insertar los datos del problema de ingeniería elegido en la función BFGS
   %
   %Sintaxis: p3_solucion_aplicacion(tol, iterMax)
   %
   %Parámetros Iniciales: 
   %            tol = un número positivo que representa a la tolerancia para el criterio: ||gradiente(f(x_k))|| <= tol
   %            iterMax = cantidad de iteraciones máximas
   %   
   %Parámetros de Salida:                           
   %            xk = aproximación de los valores de convergencia de la función f
   %            k = número de iteraciones realizados
   %            error = ||gradiente(f(x_k))||
   
   %Se inserta la ecuación del problema de ingeniería seleccionado en el metodo bfgs realizado en el archivo p3_bfgs.m
   
   [xk, k, error] = p3_bfgs('(x + 1.7*y)*sin(x) - 1.5*z - 0.1*m*cos(m+n-x) + 0.2*(n**2) - y - 1', ['x' 'y' 'z' 'm' 'n'], 10**-5, 50) #Dolan Function
   
   %[xk, k, error] = p3_bfgs('((800*x / (8*x + 8*22) + 10*x + 120)) * 2) / x - y)', ['x' 'y'], 10**-5, 100) #Máxima transferencia de potencia
   
end
