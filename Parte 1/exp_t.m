% Función exp_t(x): f(x) = e^(x)

% Entradas: x: número real
% Salidas: y: número real
% Restricciones: ---

function y = exp_t(x)
  tol = 1e-8; k = 2500; Sk = 0;
  
  for n=0:k
    Skp1 = Sk + (x)^n * div_t(factorial(n))
    if abs(Skp1 - Sk) < tol || Skp1 > div_t(eps)
      break
    endif
    Sk = Skp1;
  endfor
  y = Sk;
endfunction
  