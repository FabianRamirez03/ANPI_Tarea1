% Función pi_t
% Aproximación de pi con base en la serie de Euler para pi/2.
% Se multiplica el valor obtenido por 2 para obtener pi

% Sk = Sumatoria desde n=0 hasta infinito de (2)^n*(n!)^2/(2n+1)! = pi/2

function y = pi_t
  tol = 1e-8; k = 2500; Sk = 0;
  
  for n=0:k
    Skp1 = Sk + (2)^(n) * factorial(n)^2 * div_t(factorial(2*n+1))
    if abs(Skp1 - Sk) < tol || abs(Skp1) > div_t(eps)
      break
    endif
    Sk = Skp1;
  endfor
  y = 2*Sk;
endfunction