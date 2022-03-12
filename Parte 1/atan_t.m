% Función atan_t(x): f(x) = arctan(x)

% Entradas: x: número real
% Salidas: y: número real entre -pi/2 y pi/2
% Restricciones: ---

function y = atan_t(x)
  tol = 1e-8; k = 2500; Sk = 0;
  
  for n=0:k
    Skp1 = Sk + (-1)^n * x^(2*n+1) * div_t(2*n+1);
    if abs(Skp1 - Sk) < tol || abs(Skp1) > div_t(eps)
      break
    endif
    Sk = Skp1;
  endfor
  y = Sk;
endfunction
  