% Funci�n log_t(x,a): f(x) = log_a(x)

% Entradas: x: n�mero real, a: n�mero real
% Salidas: y: n�mero real
% Restricciones: log(a) diferente de cero

function y = log_t(x,a)
  ln_x = ln_t(x)
  ln_a = ln_t(a)
  if abs(ln_a) > eps && ((x>0 && a>1) | (x>0 && 0<a && a<1) | (a!=0 && a!=1 && a==x))
    y = ln_x * div_t(ln_a);
  else
    display("Error: la(s) entrada(s) no est� en el dominio de la funci�n")
    y = NaN;
  endif
endfunction