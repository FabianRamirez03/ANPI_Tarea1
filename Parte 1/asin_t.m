% Función asin_t(x): f(x) = arcsin(x)

% Entradas: x: número real entre -1 y 1
% Salidas: y: número real entre -pi/2 y pi/2
% Restricciones: -1 <= x <= 1

function y = asin_t(x)
  tol = 1e-8; k = 2500; Sk = 0;
  
  if -1 <= x && x <= 1
    for n=0:k
      Skp1 = Sk + factorial(2*n)*x^(2*n+1) * div_t(4^n * factorial(n)^2 *(2*n+1));
      if abs(Skp1 - Sk) < tol || abs(Skp1) > div_t(eps)
        break
      endif
      Sk = Skp1;
    endfor
    y = Sk;
  else
    display("Error: la(s) entrada(s) no está en el dominio de la función")
    y = NaN;
  endif
endfunction
  