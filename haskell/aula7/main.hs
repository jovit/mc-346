import Data.Char(toLower)

-- conta o numero de vezes um item aparece numa lista
conta it l = foldl (\ac x -> if x == it then ac + 1 else ac) 0 l
-- conta quantos elementos satisfazem uma funcao
contaf f l = foldr (\x res -> if f x then res + 1 else res) 0 l
-- troca elemento velho por novo
troca old new l = foldr(\x res -> if x == old then new:res else x:res) [] l
-- remove elemento de uma lista (primeiras n vezes)
removen it n l = fst $ foldl (\(li,nn) x -> 
    if x==it && nn>0 
        then (li,nn-1) 
        else (li++[x],nn))
  ([],n) l 
-- inserelista
-- uma matrix é implementada como uma lista de linhas (que são listas)
-- implemente transposta que transpoe uma matrix
-- implemente matmul que dado duas matrizes de formatos apropriados multiplica-as. (*)


-- testinho
-- Implemente a função vogalmaiscomum que dado um string retorna a (uma das) vogais mais comum no string. Considerar que vogais maiúsculas e minúsculas contam como a mesma vogal

filterVowelsAndLower s = foldr (\c res -> if c == 'a' || c == 'e' || c == 'i' || c == 'o' || c ==  'u' then (c:res) else res) "" (map (\c -> toLower c) s)

countChars c s = foldr (\it res -> if it == c then res + 1 else res) 0 s

contaTodos s = map (\c -> (c,(countChars c s))) s

maior l = foldr (\it res -> if (snd res) > (snd it) then res else it ) ('a', 0) l 

vogalmaiscomum s = fst (maior (contaTodos (filterVowelsAndLower s)))