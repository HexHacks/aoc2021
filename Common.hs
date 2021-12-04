module Common
( atoi
, btoi
, splitN
, modifyN
, count
, enumerate
, wordsWhen
, transpose
) where

import System.Environment

enumerate :: [a] -> [(Int, a)]
enumerate = zip (map fromIntegral [0..])

btoi :: Bool -> Int
btoi True  = 1
btoi False = 0

atoi :: String -> Int
atoi s = read s :: Int

splitN :: Int -> [a] -> ([a], [a])
splitN n l = (take n l, drop n l)

modifyN :: Int -> a -> [a] -> [a]
modifyN n new l = y where
    y = map (\(i,x) -> if i == n then new else x) enum
    enum = zip [0..] l

-- Given a predicate, count the number of occorences in a list
count :: (a -> Bool) -> [a] -> Int
count pred xs = length . (filter pred) $ xs

wordsWhen :: (Char -> Bool) -> String -> [String]
wordsWhen p s = case dropWhile p s of
                    "" -> []
                    s' -> w : wordsWhen p s''
                        where (w, s'') = break p s'

transpose :: [[a]] -> [[a]]
transpose ([]:_) = []
transpose xs = (map head xs) : transpose (map tail xs)
