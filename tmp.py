
sessions = []

course = "sql101"
date = "3/1/2020"

for s in sessions:
    if course == s["course"] and date == s["date"]:
        print(s["room"]) # will print 4A
        print(s["Capacity"]) # will print 12
        print(s["Available"]) # will print 4
        