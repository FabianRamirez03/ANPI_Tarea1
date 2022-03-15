% Función sqrt_t(x): f(x) = sqrt(x)
% Aprocimación por el método de Newton
% xkp1 = (xk + x/xk)/2  ; x0 > 0

% Entradas: x: número real
% Salidas: y: número real mayor o igual a cero
% Restricciones: x mayor o igual a cero

function y = sqrt_t(x)
  tol = 1e-8; iterMax = 2500; xk = 1;
  
  if x > 0
    for k=0:iterMax
      xkp1 = 0.5*(xk + x*div_t(xk));
      if abs(xkp1 - xk) < tol || abs(xkp1) > div_t(eps)
        break
      endif
      xk = xkp1;
    endfor
    y = xk;
  else
    display('Error: la(s) entrada(s) no está en el dominio de la función')
    y = NaN;
  endif
endfunction

