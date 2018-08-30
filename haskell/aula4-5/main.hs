
-- 4 Exercicios

-- acha um item buma arvore de busca binaria
-- verifica se uma arvore é um abb
-- insere um item numa abb
-- remove um item de uma abb
-- calcula a profundidade maxima de uma abb
-- coverte uma abb numa lista em ordem infixa (arvore-esquerda, no, arvore-direita)
-- converte uma abb numa lista em ordem prefixa (no, ae, ad)
-- converte uma lista em uma abb

data Tree a = Vazia | No a (Tree a) (Tree a) deriving (Eq,Show,Read)

acha x Vazia = False
acha x (No a esq dir) 
    | x == a = True
    | x > a = acha x dir
    | otherwise = acha x esq