somap [] = 0
somap (x: xs) = (if par x then x else 0) + somap xs