% Funci�n tan_t(x): f(x) = tan(x)

% Entradas: x: n�mero real
% Salidas: y: n�mero real
% Restricciones: x diferente de k*pi/2 con k entero impar

function y = tan_t(x)
  cos = cos_t(x);
  if abs(cos) > 1e-5
    y = sin_t(x) * div_t(cos);
  else
    display("Error: la(s) entrada(s) no est� en el dominio de la funci�n")
    y = NaN;
  endif
endfunction