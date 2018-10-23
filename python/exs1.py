# criar uma lista com apenas os valores pares de outra lista
def pares(l):
    return [x for x in l if x % 2 == 0]
# criar uma lista com os valores nas posicoes pares
def posicoes_pares(l):
    return [x for ind, x in enumerate(l) if ind % 2 == 0]

# criar um dicionario com a contagem de cada elemento numa lista
def conta_elems(l):
    dic = {}
    for x in l:
        if x in dic:
            dic[x] = dic[x] + 1
        else:
            dic[x] = 1
    return dic

# qual é a chave associada ao maior valor num dicionario
def encontra_chave_maior(dic):
    maior=-1
    maior_chave=-1
    for k,x in dic.items():
        if x > maior:
            maior_chave = k

    return maior_chave


# qual o elemento mais comum numa lista
def most_common(l):
    elem_count = conta_elems(l)
    common_key = encontra_chave_maior(elem_count)
    return common_key

# uma lista é sublista de outra?
# dado 2 strings o fim de um é igual ao comeco do outro? (do projeto de prolog)


print(pares([1,2,3,4,5,6]))
print(posicoes_pares([1,3,5,7,9,11]))
print(conta_elems([1,1,1,2,2,2,3,3,3,4,4,4,4,4,4]))
print(encontra_chave_maior({1:50, 2:10, 3:67}))