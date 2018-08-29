import datetime

now = datetime.datetime.now()
today = input("Do you want to know todays' week number? \n> ")

if today == 'y':
    yr = now.year
    mo = now.month
    dy = now.day
else:
    cy = input("For current year? (y/n) \n> ")
    if cy == 'y':
        yr = now.year
    else:
        yr = int(input("Which yearh then? (yyyy) \n> "))

    cm = input("For current month? (y/n) \n> ")
    if cm == 'y':
        mo = now.month
    else:
        mo = int(input("Which month then? (mm) \n> "))

    dy = int(input("What day? (dd) \n> "))


dt = datetime.date(yr, mo, dy)
wk = dt.isocalendar()[1]

print(f"Week number is >> {wk} <<")