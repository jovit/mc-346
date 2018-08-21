-- List comprehension
removeAll c lista = [y | y <- lista, y /= c]

-- Como declarar o tipo da função(para quando o inferencia de tipo não funciona)
ordenada :: Ord t => [t] -> Bool
ordenada [] = True
ordenada [_] = True
ordenada (a:b:xs)
    | a < b = ordenada (b:xs)
    | otherwise = False