from metodos_p2 import *
from sympy import *

#Valores iniciales:
r = 10
alpha = 4
sigmaDB = 4
lam = 1
x1 = 7
x2 = 6

d = Symbol('x')

# Derivados de la tarea:
k = (10 * alpha) / log(10)
print ("k: ", k)

S = math.pi * pow(r, 2)
print ("s: ", S)

gFunc = (((2 * S) / math.pi) * acos(d / (2 * r))) - (d * sqrt(pow(r, 2) - (pow(d, 2) / 4)))
print ("g1: ", gFunc)

gFunc2 = pow(gFunc, 2)
print ("g2: ", gFunc2)

sigmaR2 = pow(sigmaDB, 2) / pow(10 * alpha, 2)
print ("sigmaR: ", sigmaR2)

sigmaC2 = (gFunc2 / (2 * lam * pow(k, 2))) * ((1 / gFunc) + (1 / S))
print ("sigmaC: ", sigmaC2)

# Función.
fFunc = str((log(x1 / d, 10) / (sigmaR2 * log(10))) + ((d * (x2 - d)) / sigmaC2))

# Pruebas con los métodos implementados.
newton_H_m1(fFunc, 5, 10**-5, 100)


