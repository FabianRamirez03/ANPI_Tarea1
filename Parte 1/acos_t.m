% Función acos_t(x): f(x) = arccos(x)

% Entradas: x: número real entre -1 y 1
% Salidas: y: número real entre 0 y pi/2
% Restricciones: -1 <= x <= 1

function y = acos_t(x)
  if -1 <= x && x <= 1
      y = pi_t/2 - asin_t(x); 
  else
    display("Error: la(s) entrada(s) no está en el dominio de la función")
    y = NaN;
  endif
endfunction
