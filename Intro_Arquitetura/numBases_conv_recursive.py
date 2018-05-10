#!/usr/bin/python3

def decToBase(n, base):
    resto = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F']
    if n == 0:
        return ''
    return decToBase(n//base, base) + resto[n % base]

def baseToDec(n, base, exp):
    exp += 1
    if len(n) == 1:
        return int(n[len(n) - 1]) * (base**(exp-1))
    return baseToDec(n[:-1], 2, exp) + int(n[len(n) - 1]) * (base**(exp-1))


def main():
    d = int(input('DECIMAL PARA SER CONVERTIDO: '))
    b = int(input('QUAL BASE DESEJA CONVERTER?: ')) 
    a = input('INFORME UM NÚMERO EM QUALQUER BASE: ')
    c = int(input('QUAL A BASE DO NÚMERO ANTERIOR?: '))
    x = decToBase(d, b)
    y = baseToDec(a, b, 0)
    print("DECIMAL CONVERTIDO = {}".format(x))
    print("BASE CONVERTIDA PARA DECIMAL = {}".format(y))

if __name__ == "__main__":
    main()

