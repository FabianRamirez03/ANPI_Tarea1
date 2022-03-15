% Funci�n sqrt_t(x): f(x) = sqrt(x)
% Aprocimaci�n por el m�todo de Newton
% xkp1 = (xk + x/xk)/2  ; x0 > 0

% Entradas: x: n�mero real
% Salidas: y: n�mero real mayor o igual a cero
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
    display('Error: la(s) entrada(s) no est� en el dominio de la funci�n')
    y = NaN;
  endif
endfunction

