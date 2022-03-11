% Función tan_t(x): f(x) = tan(x)

% Entradas: x: número real
% Salidas: y: número real
% Restricciones: x diferente de k*pi/2 con k entero impar

function y = tan_t(x)
  cos = cos_t(x);
  if abs(cos) > 1e-5
    y = sin_t(x) * div_t(cos);
  else
    display("Error: la(s) entrada(s) no está en el dominio de la función")
    y = NaN;
  endif
endfunction