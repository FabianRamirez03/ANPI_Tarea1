% Función tanh_t(x): f(x) = tanh(x)

% Entradas: x: número real
% Salidas: y: número real entre -1 y 1
% Restricciones: ---

function y = tanh_t(x)
  cosh = cosh_t(x);
  if abs(cosh) > eps
    y = sinh_t(x) * div_t(cosh);
  else
    display("Error: la(s) entrada(s) no está en el dominio de la función")
    y = NaN;
  endif
endfunction