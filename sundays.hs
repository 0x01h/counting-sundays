day_of_week :: Int -> Int -> Int -> Int
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