def print_n(iter, n):
    for _i in range(n):
        x = next(iter)
        print(x, end=' ')
    print("")
    return None

# pares: dado um iterator, retorna um iterator com os elementos nas posicoes pares (0,2)
def pares(iter):
    i = 0
    for x in iter:
        if (i % 2 == 0):
            yield x
        i = i + 1

# reverte: dado um iterator, reverte ele *
def reverse_iter(i):
    l = list(i)
    l.reverse()
    return iter(l)

# zip: dado 2 iterators, retorna um iterator que retorna os elementos intercalados
def zip(iterator1, iterator2):
    x = next(iterator1)
    current_iterator = 1
    while x != None:
        yield x
        if current_iterator == 1:
            current_iterator = 2
            x = next(iterator2)
        else:
            current_iterator = 1
            x = next(iterator1)
    if current_iterator == 1:
        return iterator2
    else:
        return iterator1

# cart: dado 2 iterators, retorna um iterator com o produto cartesiano dos elementos *
def cart(iterator1, iterator2):
    list1 = list(iterator1)
    list2 = list(iterator2)
    for x in list1:
        for y in list2:
            yield (x, y)

# ciclo: dado um iterator, retorna os elemento snum ciclo infinito
def ciclo(iterator):
    iterator_list = list(iterator)
    while True:
        for x in iterator_list:
            yield x


# rangeinf(init,passo=1): retorna um iterator que gera numeros de init ate infinito, com passo
def rangeinf(init, passo=1):
    current = init
    while True:
        yield current
        current = current + passo

# take: como o take do haskell
def take(n, l):
    return (l[i] for i in range(min(n, len(l))))

# drop - como o drop do haskell
def drop(n, l):
    return (l[i] for i in range(n, len(l)))

print("1 ---------")
print_n(pares(iter([1, 2, 3, 4, 5, 6, 7])), 3)
print("2 ---------")
print_n(reverse_iter(iter([1, 2, 3, 4, 5, 6, 7])), 7)
print("3 ---------")
print_n(zip(iter([1, 2, 3, 4, 5, 6, 7]), iter([8, 9, 10, 11, 12, 13, 14])), 7)
print("4 ---------")
print_n(cart(iter([1, 2, 3, 4, 5, 6, 7]),
             iter([8, 9, 10, 11, 12, 13, 14])), 20)
print("5 ---------")
print_n(ciclo(iter([1, 2, 3, 4, 5, 6, 7])), 20)
print("6 ---------")
print_n(rangeinf(1,5), 20)
print("7 ---------")
print_n(take(5,[1,2,3,4,5,6,7,8]), 5)
print("8 ---------")
print_n(drop(5,[1,2,3,4,5,6,7,8]), 3)