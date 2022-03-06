function [xk, k, error] = p3_bfgs(f, vars, tol, iterMax)

    %Esta función se encarga de buscar el punto que minimiza una función de varias variables
    %
    %Sintaxis: p3_bfgs(f, vars, tol, iterMax)
    %
    %Parámetros Iniciales: 
    %            f = es un string que representa a la función f
    %            vars = es una lista que incluye debe incluir todas las variables presentes en la función
    %            tol = un número positivo que representa a la tolerancia para el criterio: ||gradiente(f(x_k))|| <= tol
    %            iterMax = cantidad de iteraciones máximas
    %   
    %Parámetros de Salida:                           
    %            xk = aproximación de los valores de convergencia de la función f
    %            k = número de iteraciones realizados
    %            error = ||gradiente(f(x_k))||

    pkg load symbolic
    
    func = matlabFunction(sym(f));
    quantVars = length(vars);

    for i = 1:quantVars
      symVars(i) = sym(vars(i));
      x0(i) = rand() * 10; #xk aleatorio mayor que cero
    endfor 
    xk = x0';   
    
    g = gradient(func, symVars); #Se obtiene la función gradiente
    gk = double(subs(g, symVars, x0)); #Se evalua g con el valor inicial x0

    bk = eye(quantVars); #Matriz nxn donde n es la quantVars
   
    sigma1 = 0.4; #Sigma 1 debe ser menor que sigma 2
    sigma2 = 0.5; #Sigma 2 debe ser menor que 1
    alpha = 1;
    epsilon = 1;
    lambdaR = 0.3
    
    #Se asigna el valor de k y el error
    k = 0;
    error = tol + 1;
    e = [];
    
    while and(error > tol, k < iterMax) #Bucle principal del programa
      
      pk = bk**-1 * -gk; #Calcular pk
      lambdak = 1; #Un valor inicial para lambdak
      count = 1; #Contador de iteraciones para lambdak
      check = false; #Bandera de fallo al calcular lambdak
      
      while true #Bucle para calcular lambdak
        lambdak = lambdaR^count;
        a = xk + (lambdak * pk);
        izq1 = double(subs(func, symVars, a)); #Término de la derecha para la inecuación (2.6)
        der1 = (double(subs(func, symVars, xk)) + (sigma1 * lambdak * gk' * pk)); #Término de la izquierda para la inecuación (2.6)
        if izq1 <= der1
          display('Lambda encontrado')
          break
        elseif count > 10
          display('Lambda no encontrado')
          check = true;
          break
        else
          lambdak = lambdak / 5;
          count += 1;
          display(lambdak)
        end
       end
       
       if check
         break #Si check es True, hay que volver a correr el programa
       end
      
       xk1 = xk + (lambdak * pk); #Calcular xk1
       
  
       sk = xk1 - xk;
       gk1 = double(subs(g, symVars, xk1));
       yk = gk1 - gk;
           
       if (yk' * sk) / norm(sk)**2 >= epsilon * norm(gk)**alpha #Calculo de bk si se cumple la condición por la ecuación (2.10)
         bk = bk - (((bk * sk) * (sk' * bk)) / (sk' * bk * sk)) + ((yk * yk') / (yk' * sk));
       end #En caso de no entrar a la comparació, bk mantiene su valor
       
       error = double(norm(subs(g, symVars, xk))); #Calcular error con la norma del gradiente
       e = [e error];
       k = k + 1;

       #Se actualizan los valores de xk y gk para seguir con la nueva iteración
       xk = xk1;
       gk = gk1;
    end
    plot(1 : k, e) 
end
