% Función sinh_t(x): f(x) = sinh(x)

% Entradas: x: número real
% Salidas: y: número real
% Restricciones: ---

function y = sinh_t(x)
  tol = 1e-8; k = 2500; Sk = 0;
  
  for n=0:k
    Skp1 = Sk + x^(2*n+1) * div_t(factorial(2*n+1))
    if abs(Skp1 - Sk) < tol || abs(Skp1) > div_t(eps)
      break
    endif
    Sk = Skp1;
  endfor
  y = Sk;
endfunction
  