-- posicoes - dado um item e uma lista, retorna uma lista com todas as posicoes (primeiro elemento esta na posicao 1) do item na lista
len [] = 0
len (x: xs) = 1 + len xs

posicoes it l = [(x, i) | x <- l, x == it, i <- [0 .. (len l) - 1], x == it]

-- split - dado um item e uma lista retorna uma lista de listas, todos os elementos da lista antes do item (a primeira vez que ele aparece) e todos depois
split :: [Char] -> Char -> [[Char]]
split [] it = [[]]
split (x:xs) it 
    | x == it = [[],xs]
    | tail sp == [] = [[x] ++ head sp]
    | otherwise = [[x] ++ head sp] ++ [ head (tail sp) ]
    where
        sp = split xs it

-- splitall - mesma coisa que o split mas retorna todas as sublistas
splitAll :: [Char] -> Char -> [[Char]]
splitAll [] it = [[]]
splitAll (x:xs) it 
    | x == it = [[]] ++ splitAll xs it
    | tail sp == [] = [[x] ++ head sp]
    | otherwise = [[x] ++ head sp] ++ tail sp
    where
        sp = splitAll xs it

-- drop n lista - a lista sem os n primeiros elementos
dropN :: Int -> [t] -> [t]
dropN _ [] = []
dropN 0 l = l
dropN n (x:xs) = dropN (n - 1) xs

-- take n lista - os primeiros n elementos da lista
takeN 0 _ = []
takeN _ [] = []
takeN n (x: xs) = [x] ++ takeN (n-1) xs 
    