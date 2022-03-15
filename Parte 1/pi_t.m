% Funci�n pi_t
% Aproximaci�n de pi mediante el m�todo iterativo de Newton-Raphson
% xkp1 = xk - tan(xk)
% x0 = 3

function y = pi_t()
  tol = 1e-8; iterMax = 2500; 
  xk = 3;
  
  for k=0:iterMax
    xkp1 = xk - tan_t(xk);
    if abs(xkp1 - xk) < tol || abs(xkp1) > div_t(eps)
      break
    endif
    xk = xkp1;
  endfor
  y = xk;
endfunction

