% Función power_t(x,a): f(x) = a^(x)

% Entradas: x: número real
% Salidas: y: número real
% Restricciones: {x element R : (a!=0 and x element Z) or (x>=1 and x element Z) or (a>=0 and x>0) or a>0}

function y = power_t(x,a)
  tol = 1e-8; k = 2500; Sk = 0;

  if (a!=0 && mod(x,1) == 0) || (x>=1 && mod(x,1) == 0) || (a>=0 && x>0) || a>0
    for n=0:k
      Skp1 = Sk + (x-1)^n *a* (ln_t(a))^n *div_t(factorial(n))
      if abs(Skp1 - Sk) < tol || abs(Skp1) > div_t(eps) || isnan(Skp1)    
        break
      endif
      Sk = Skp1;
    endfor
    y = Sk;
  else
    display('Error: la(s) entrada(s) no está en el dominio de la función')
    y = NaN;
  endif
endfunction
