larg, alt = map(int, input("Digite a largura e altura da imagem separadas por espaço:\n").split())
x, y = map(int,input("Digite as coordenadas x e y do display em que a imagem vai começar a ser printada:\n").split())

endereco = hex((y * 320) + x)
printaendereco = ''

if len(endereco) == 6:
    printaendereco = endereco[2:]

elif len(endereco) < 6:
    diff = 4 - len(endereco)
    zeros = str(diff * '0')
    printaendereco = (zeros + endereco[2:])
    
linhaseg = hex(320 - larg)
linhaseg = linhaseg[2:]
    


print(f"O endereço inicial para printar a imagem será 0xFF00{printaendereco.upper()}\nPara printar na linha seguinte, some 0x{linhaseg.upper()} ao endereço atual.")

input('Enter para fechar')