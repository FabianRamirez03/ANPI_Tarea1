% Script de prueba de las funciones

function test_funtras()
  esperado = 0.88737885860342994;
  numerador = root_t(sin_t(3/7) + ln_t(2) ,3);
  resultado = numerador/sinh_t(sqrt_t(2)) + atan_t(exp_t(-1)); 
  error = abs(esperado - resultado)/esperado;
  
  printf("=============================== \n");
  printf("             Prueba             \n");
  printf("=============================== \n");
  printf("Valor esperado: %f \n", esperado);
  printf("Valor esperado: %f \n", resultado);
  printf("Error: %d \n", error);
  printf("=============================== \n");
    
endfunction

