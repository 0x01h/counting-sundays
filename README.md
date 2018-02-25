# BLG 458E - HW #1 #
## Counting Sundays in Haskell. ##

**What does the helper function (sundays') calculate?**

"sundays'" calculates the total number of Sundays which is on the first day of the month and keep recursion untill the given parameter (end year) is reached.

**What if you don't define a "rest" and use its expression where it's needed?**

It would create code redundancy, and also in Haskell, using guards rather than nested if statements is a better coding practice.

**What is the possibility that a certain day of a month (such as 1 Jan, or your birthday) is a Sunday (or some other day)? Are all days equally possible?**

Total number of days in 400 years is 146100. And, not all days are equally possible because there are 3 extra days coming from 146100 % 7. The possibility is (20871 + 3 * 1 / 7) / (146100) = 0.14285714285714288

> This question was solved in daysinyear.py file.




