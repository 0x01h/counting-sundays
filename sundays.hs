-- Author: Orçun Özdemir
-- ID: 150140121
-- Date: February 25, 2018

day_of_week :: Integer -> Integer -> Integer -> Integer
day_of_week y m d = z
  where
    z = (d + t1 + k + t2 + t3 + 5 * j) `mod` 7
    j = y `div` 100
    k = y `mod` 100
    t1 = floor(fromIntegral (13 * (m' + 1)) / 5.0)
    t2 = floor(fromIntegral k / 4.0)
    t3 = floor(fromIntegral j / 4.0)
    m' =
      if m <= 2 then m + 12
      else m + 0

sundays1 :: Integer -> Integer -> Integer
sundays1 start end = sundays' start 1
  where
    sundays' :: Integer -> Integer -> Integer
    sundays' y m
      | y > end = 0
      | otherwise = if day_of_week y m 1 == 1 then rest + 1 else rest
      where
        nextY = y + 1
        nextM = m + 1
        rest = if (nextM == 13) then sundays' nextY 1 else sundays' y nextM

leap :: Integer -> Bool
leap y = a && b || c
  where
    a = ((y `mod` 4) == 0)
    b = ((y `mod` 100) /= 0)
    c = ((y `mod` 400) == 0)

days_in_month :: Integer -> Integer -> Integer
days_in_month m y
  | m == 2 = if leap y then 29 else 28
  | (m == 4) || (m == 6) || (m == 9) || (m == 11) = 30
  | otherwise = 31

sundays2 :: Integer -> Integer -> Integer
sundays2 start end = sundays' start 1 2
  where
    sundays' :: Integer -> Integer -> Integer -> Integer
    sundays' y m weekday
      | y > end = 0
      | otherwise = if ((weekday `mod` 7) == 0) then rest + 1 else rest
      where
        nextY = y + 1
        nextM = m + 1
        rest = if (nextM == 13) then sundays' nextY 1 (weekday + ((days_in_month m y) `mod` 7)) else sundays' y nextM (weekday + ((days_in_month m y) `mod` 7))

sundays1_tail :: Integer -> Integer -> Integer
sundays1_tail start end = sundays' start 1
  where
    acc = 1
    sundays' :: Integer -> Integer -> Integer
    sundays' y m
      | y > end = acc
      | otherwise = if day_of_week y m 1 == 1 then rest acc + 1 else rest acc
        where
          nextY = y + 1
          nextM = m + 1
          rest :: Integer -> Integer
          rest acc
            | nextM == 13 = sundays' nextY 1
            | otherwise = sundays' y nextM
