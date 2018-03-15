# Author: Orçun Özdemir
# ID: 150140121
# Date: February 25, 2018

def days_in_year(x):
    z = 0
    for y in range(0, x):
        if (y % 4) == 0:
            z += 366
        else:
            z += 365
    return z

print("Total number of days in 400 years:", days_in_year(400))
print("400 % 7 =", days_in_year(400) % 7)
print("So, there are",  days_in_year(400) % 7, "extra days, all days are not equally possible!")

result = (20871 + 3 * 1 / 7) / (146100)

print("Possibility that a certain day of a month is a Sunday: ", result)
