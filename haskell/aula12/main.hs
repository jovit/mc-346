import System.IO
import Data.Char


dividendo [] = 0
dividendo (x:xs) = (ord (head (s))) * (ord(head (tail s)))  + dividendo xs
    where s = words x

divisor [] = 0
divisor (x:xs) = ord (head (tail s)))  + divisor xs
    where s = words x

main = do
    dados <- getContents
    let li = (lines dados)
    let n = dividendo li
    let w = divisor li
    let saida = div n w 
    putStrLn (show saida)
