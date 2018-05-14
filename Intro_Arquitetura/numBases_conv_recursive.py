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

def menu_calc():
    print('QUAL OPERAÇÃO DESEJA REALIZAR? ')
    print('[ 1 ] DECIMAL        ->          BINÁRIO')
    print('[ 2 ] BINÁRIO        ->          DECIMAL')
    print('[ 3 ] DECIMAL        ->          OCTAL')
    print('[ 4 ] OCTAL          ->          DECIMAL')
    print('[ 5 ] HEXADECIMAL    ->          DECIMAL')
    print('[ 6 ] DECIMAL        ->          HEXADECIMAL')
    print('[ 0 ] SAIR')

    option = input('ESCOLHA A OPÇÃO: ')
    return option 


def main():

if __name__ == "__main__":
    main()

