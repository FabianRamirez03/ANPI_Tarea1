% Función root_t(x,a)

% Entradas: x: número real positivo
% Salidas: y: número real
% Restricciones: ---

function y = root_t(x,a)
  pkg load symbolic
  tol = 1e-8; iterMax = 2500; y=NaN;

  syms z;
  g=@(z) z^a - x;
  gg = g(z);
  dg = diff(gg, z);
  dgdx = matlabFunction(dg);
  xk = 0.5*x;
  
  for k=0:iterMax  
    if dgdx(xk) != 0
      xkm1 = xk - (g(xk)/dgdx(xk));
      if abs(xkm1-xk) < tol*abs(xkm1)
        break
      endif
      xk = xkm1;
    else
      display('La derivada de la función se hizo cero')
    endif
    y = xk;
  endfor
endfunction
      