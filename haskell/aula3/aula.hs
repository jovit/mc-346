-- List comprehension
removeAll c lista = [y | y <- lista, y /= c]

-- Como declarar o tipo da função(para quando o inferencia de tipo não funciona)
ordenada :: Ord t => [t] -> Bool
ordenada [] = True
ordenada [_] = True
ordenada (a:b:xs)
    | a < b = ordenada (b:xs)
    | otherwise = False


-- Bom declarar tipos para pegar erros na compilação de tipos errados (erros mais fáceis de entender também)

-- quick sort
qs [] = []
qs (x:xs) = menor ++ [x] ++ maior
    where 
        menor = qs [y | y <- xs, y <= x ]
        maior = qs [y | y <- xs, y > x]

-- fazer split do ex 3