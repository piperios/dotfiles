import core
import json


while True:
    name = str(input('What is your name? '))

    print (('Are you sure %s is your name? y/n') % (name))
    _ = input()

    if _ == 'y' or _ == 'yes':
        print ('Let us continue then.')
        break
    elif _ == ('n' | 'no'):
        print ('Okay then.')
    else:
        print ("I'm sorry, but your choice wasn't valid.")

while True:
    gender = input("So, say, are you a man or a woman?")
    if gender == "Male" or gender == "Female":
        print ("Okay, let's move on to classes!")
        break
    else:
        print ("Sorry, I don't think that exists...")



while True:
    if gender == "Male":
        _ = input("This game features a gender based class system. The classes\
for male are: Knight, Wizard, Thief, Brawler. Which would you like to pick?")
        if _ == "Knight":
            print 
