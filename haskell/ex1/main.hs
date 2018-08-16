par y = if (mod y 2) == 0 then True else False

somap [] = 0
somap (x: xs) = (if par x then x else 0) + somap xs

--    tamanho de uma lista
tam [] = 0
tam (x:xs) = tam(xs) + 1

--    soma dos elementos de uma lista
soma [] = 0
soma (x:xs) = x + soma(xs)

--    soma dos números pares de uma lista
somap2 [] = 0
somap2 (x: xs)
    | par x = x + somap2 xs
    | otherwise = somap2 xs

--    soma dos elementos nas posições pares da lista ( o primeiro elemento esta na posicao 1)
somapp [] = 0
somapp (x:[]) = 0
somapp (x: xs) = head(xs) + somapp(tail(xs))

--    existe item na lista (True ou False)
existe it [] = False
existe it (x:xs)
    | x == it = True
    | otherwise = existe it xs

--    posição do item na lista (0 se nao esta la, 1 se é o primeiro)
posicao it [] = 0
posicao it (x:xs)
    | it == x = 1
    | (existe it xs) = (1 + posicao it xs)
    | otherwise = 0


--    conta quantas vezes o item aparece na lista (0 se nenhuma)
conta it [] = 0
conta it (x:xs) 
    | x == it = 1 + (conta it xs)
    | otherwise = conta it xs

--    maior elemento de uma lista - FAZER p/ proxima aula - variáveis locais
maior [] = 0
maior (x:[]) = x
maior (x:xs)
    | (x > maior xs) = x
    | otherwise = maior xs

--    reverte uma lista - FAZER p/ próxima aula - recursão com acumulados
rever [] = []
rever (x:[y]) = [y,x]
rever (x:xs) = (rever xs) ++ [x]

--    intercala 2 listas (intercala1 e intercala2)
--    intercala1 [1,2,3] [4,5,6,7,8]
--     ==> [1,4,2,5,3,6]
intercala1 [x] (y:ys) = [x,y]
intercala1 (x:xs) [y] = [x,y]
intercala1 (x:xs) (y:ys) = [x,y] ++ (intercala1 xs ys)

--    intercala2 [1,2,3] [4,5,6,7,8]
--     ==>  [1,4,2,5,3,6,7,8]
intercala2 [x] (y:ys) = [x,y] ++ ys
intercala2 (x:xs) [y] = [x,y] ++ xs
intercala2 (x:xs) (y:ys) = [x,y] ++ (intercala2 xs ys)

--    a lista ja esta ordenada?
sorted [] = True
sorted [x] = True
sorted (x:xs) = (x <= (head xs)) && (sorted xs)

--    dado n gera a lista de 1 a n
genL 0 = []
genL n = (genL (n - 1)) ++ [n]

--    retorna o ultimo elemento de uma lista
lastElem [x] = x
lastElem (x:xs) = lastElem xs
--    retorna a lista sem o utlimo elemento
remLast [] = []
remLast [x] = []
remLast (x:xs) = x:(remLast xs)
--    shift right
--    shiftr [1,2,3,4]
--     ==> [4,1,2,3]
shiftr1 [] = []
shiftr1 (x:[]) = [x]
shiftr1 (x:xs) = (head(shiftr1 xs):(x:tail(shiftr1 xs)))

--    shiftr n lista (shift right n vezes)
shiftr 0 (x:xs) = (x:xs)
shiftr n (x:[]) = [x]
shiftr n (x:xs) = shiftr (n-1) (head(shiftr 1 xs):(x:tail(shiftr 1 xs)))

--    shift left
shiftl1 [] = []
shiftl1 (x:xs) = xs ++ [x]

--    shift left n vezes
shiftl 0 l = l
shiftl n [] = []
shiftl n l = shiftl (n - 1) (shiftl1 l)

--    remove item da lista (1 vez so)
rem1 it [] = []
rem1 it (x:xs)
    | it == x = xs
    | otherwise = (x:(rem1 it xs))

--    remove item da lista (todas as vezes)
rem2 it [] = []
rem2 it (x: xs)
    | it == x = rem2 it xs
    | otherwise = (x:(rem2 it xs))

--    remove item da lista n (as primeiras n vezes)
rem3 it q [] = []
rem3 it 0 l = l
rem3 it q (x: xs)
    | it == x = rem3 it (q - 1) xs
    | otherwise = (x:(rem3 it q xs))

--    remove item da lista (a ultima vez que ele aparece) 
remu it [] = []
remu it (x:xs)
    | x /= it = (x:(remu it xs))
    | (remu it xs) /= xs = (x:(remu it xs))
    | otherwise = xs 

-- troca velho por novo na lista 1 so vez
switch1 it v [] = []
switch1 it v (x:xs)
    | x == it = (v:xs)
    | otherwise = x:(switch1 it v xs)

-- troca velho por novo na lista todas vezes
switchN it v [] = []
switchN it v (x:xs)
    | x == it = v:(switchN it v xs)
    | otherwise = x:(switchN it v xs)
-- troca velho por novo na lista n as primeiras n vezes