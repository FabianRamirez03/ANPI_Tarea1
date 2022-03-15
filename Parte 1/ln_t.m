% Función ln_t(x): f(x) = ln(x)

% Entradas: x: número real
% Salidas: y: número real
% Restricciones: x debe ser positivo

function y = ln_t(x)
  tol = 1e-8; k = 2500; Sk = 0; y = NaN;
  
  if x > 0
    for n=0:k
      Skp1 = Sk + div_t(2*n+1) * ((x-1)*div_t(x+1))^(2*n);
      if abs(Skp1 - Sk) < tol || Skp1 > div_t(eps) 
        break
      endif
      Sk = Skp1;
    endfor
    y = 2*(x-1)*div_t(x+1)*Sk;
  else
    display("Error: la(s) entrada(s) no está en el dominio de la función")
    y = NaN;    
  endif
endfunction