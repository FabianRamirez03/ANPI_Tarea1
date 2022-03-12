% Funci�n asin_t(x): f(x) = arcsin(x)

% Entradas: x: n�mero real entre -1 y 1
% Salidas: y: n�mero real entre -pi/2 y pi/2
% Restricciones: -1 <= x <= 1

function y = asin_t(x)
  tol = 1e-8; k = 2500; Sk = 0;
  
  if -1 <= x && x <= 1
    for n=0:k
      Skp1 = Sk + factorial(2*n)*x^(2*n+1) * div_t(4^n * factorial(n)^2 *(2*n+1));
      if abs(Skp1 - Sk) < tol || abs(Skp1) > div_t(eps)
        break
      endif
      Sk = Skp1;
    endfor
    y = Sk;
  else
    display("Error: la(s) entrada(s) no est� en el dominio de la funci�n")
    y = NaN;
  endif
endfunction
  