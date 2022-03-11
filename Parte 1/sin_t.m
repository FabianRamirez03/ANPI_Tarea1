% Función sin_t(x): f(x) = sin(x)

% Entradas: x: número real
% Salidas: y: número real entre -1 y 1
% Restricciones: ---

function y = sin_t(x)
  tol = 1e-8; k = 2500; Sk = 0;
  
  for n=0:k
    Skp1 = Sk + (-1)^n * x^(2*n+1) * div_t(factorial(2*n+1));
    if abs(Skp1 - Sk) < tol || abs(Skp1) > div_t(eps)
      break
    endif
    Sk = Skp1;
  endfor
  y = Sk;
endfunction
  