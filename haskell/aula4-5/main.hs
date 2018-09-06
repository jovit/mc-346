
-- 4 Exercicios

-- verifica se uma arvore é um abb
-- insere um item numa abb
-- remove um item de uma abb
-- calcula a profundidade maxima de uma abb
-- coverte uma abb numa lista em ordem infixa (arvore-esquerda, no, arvore-direita)
-- converte uma abb numa lista em ordem prefixa (no, ae, ad)
-- converte uma lista em uma abb

data Tree a = Vazia | No a (Tree a) (Tree a) deriving (Eq,Show,Read)

-- acha um item buma arvore de busca binaria
acha x Vazia = False
acha x (No a esq dir) 
    | x == a = True
    | x > a = acha x dir
    | otherwise = acha x esq
-- acha 8 (No 5 (No 3 (No 2 Vazia Vazia) Vazia) (No 8 Vazia (No 9 Vazia Vazia)))

-- Teste
-- imlemente uma funçao que dado um lista de dados retorna uma arvore de busca binária dos dados (nao precisa estar balanceada)
insereArvore :: (Ord a, Eq a) => Tree a ->  a -> Tree a

insereArvore Vazia n = No n Vazia Vazia
insereArvore (No a esq dir) n
    | n > a = (No a esq (insereArvore dir n))
    | otherwise = (No a (insereArvore esq n) dir)
    
inserelista :: (Ord a, Eq a) => [a] -> Tree a
inserelista [] = Vazia
inserelista (x:xs) = (insereArvore (inserelista xs) x)

