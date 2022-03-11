% Función cosh_t(x): f(x) = cosh(x)

% Entradas: x: número real
% Salidas: y: número real mayor o igual a 1 
% Restricciones: ---

function y = cosh_t(x)
  tol = 1e-8; k = 2500; Sk = 0;
  
  for n=0:k
    Skp1 = Sk + x^(2*n) * div_t(factorial(2*n));
    if abs(Skp1 - Sk) < tol || abs(Skp1) > div_t(eps)
      break
    endif
    Sk = Skp1;
  endfor
  y = Sk;
endfunction