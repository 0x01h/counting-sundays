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