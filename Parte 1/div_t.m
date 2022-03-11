% Función div_t(x): f(x) = x^(-1)

% Entradas: x: número real diferente de cero
% Salidas: y: número real diferente de cero
% Restricciones: x diferente de cero

function y = div_t(x)
  tol = 1e-8;
  iterMax = 2500;
  
  if x == 0
    display("Error: la(s) entrada(s) no está en el dominio de la función")
    y = NaN;
  else
    if factorial(0) < x <= factorial(20)
      xk = eps^2;
    elseif factorial(20) < x <= factorial(40)
      xk = eps^4;
    elseif factorial(40) < x <= factorial(60)
      xk = eps^8;
    elseif factorial(60) < x <= factorial(80)
      xk = eps^11;
    elseif factorial(80) < x <= factorial(100)
      xk = eps^15;
    endif
    
    for k=0:iterMax
      xkp1 = xk*(2 - abs(x)*xk);
      if abs(xkp1 - xk) < tol*abs(xkp1)
        break
      endif
      xk = xkp1;
    endfor
    
    if x < 0
      y = -1*xk;
    else
      y = xk;
    endif
    
  endif
endfunction
  