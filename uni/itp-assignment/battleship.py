# Apostolos Piperis, A.M 4475

import random

print ('BATTLESHIP GAME \nThe objective of this game is to sink the opponent\'s ships \
before the opponent sinks yours')

# Asks the player to choose between PvP and PvCPU
players_number = input('Input 1 for 1-player game or 2 for 2-player game: ')

# A list with all the valid grid position choices
valid_choices = ['a1','a2','a3','a4','a5',
                 'b1','b2','b3','b4','b5',
                 'c1','c2','c3','c4','c5',
                 'd1','d2','d3','d4','d5',
                 'e1','e2','e3','e4','e5']

# List containing y axis cooordinates 
board_y = ['a','b','c','d','e']

# List containing x axis coordinates
board_x = ['1','2','3','4','5']

# Allocation of ships in a 1-player match
if players_number == '1':
    # Allocation of player's ships
    player_ships = []
    for _ in range(5):
        choice = input('Player 1 enter the position of ship no. %i: ' % (_+1))
        while True:
            if choice not in valid_choices:
                choice = input('Invalid position, or position already taken. Try again: ')
            elif choice in player_ships:
                choice = input('Invalid position, or position already taken. Try again: ')
            else:
                break
        player_ships.append(choice)
    
    # Allocation of CPU's ships
    cpu_ships = []
    for _ in range(5):
       cpu_choice = random.choice(valid_choices)
       while True:
           if cpu_choice in cpu_ships:
               cpu_choice = random.choice(valid_choices)
           else:
               break
       cpu_ships.append(cpu_choice)

# Allocation of ships in a 2-player match
if players_number == '2':
    # Allocation of player 1's ships
    player1_ships = []
    for _ in range(5):
        player1_choice = input('Player 1 enter the position of ship no. %i: ' % (_+1))
        while True:
            if player1_choice not in valid_choices:
                player1_choice = input('Invalid position, or position already taken. Try again: ')
            elif player1_choice in player1_ships:
                player1_choice = input('Invalid position, or position already taken. Try again: ')
            else:
                break
        player1_ships.append(player1_choice)

    # Allocation of player 2's ships
    player2_ships = []
    for _ in range(5):
        player2_choice = input('Player 2 enter the position of ship no. %i: ' % (_+1) )
        while True:
            if player2_choice not in valid_choices:
                player2_choice = input('Invalid position, or position already taken. Try again: ')
            elif player2_choice in player2_ships:
                player2_choice = input('Invalid position, or position already taken. Try again: ')
            else:
                break
        player2_ships.append(player2_choice)

# Core gameplay, 1-player game

def board(marker):

    # Printing player number
    print('  ' + 'P1' + '      ' + 'P2')

    # Printing horizontal coordinates
    print(' ' + ''.join(board_x) + '   ' + ''.join(board_x))
    
    # Printing vertical coordinates
    for i in board_y:
        print ('%s' + '     ' + '%s' % i)

# Function that checks if the player's  move is a hit, miss, or invalid 

def checkMovePlayer(choice):
    used_moves_player  = []
    if choice in valid_choices:
        if choice in cpu_ships:
            print ('Target hit!')
            used_moves.append(choice)
            return True
        else:
            print ('Target missed!')
            used_moves.append(choice)
            return False
    elif choice in used_moves:
        print ('Invalid position, or move already used. Try again: ')
    else:
        print ('Invalid position, or move alreadt used. Try again: ')

# Function that checks if the CPU's move is a hit or miss

def checkMoveCPU(choice):
    used_moves_cpu = []
    if choice in player_ships:
        print ('Target hit!')
        return True
    else:
        print ('Target missed!')
        return False

# Function that controls the player's moves

def userMove(choice):
    
    while True:
        choice = input('Player 1 enter the position to launch your missile: ')

        validity = checkMove(choice)
        if validity == True:
            cpu_ships.remove(choice)
        print ('Missile launched at %s' % choice)

# Fucntion that controls the CPU's moves

def cpuMove(choice):
    
    while True:
        choice = random.choice(valid.choices)
        validitiy =  checkMove(choice)
        if vailidity == True:
            player_ships.remove(choice)
        print ('Missile launched at %s' % choice)
        return True

# Function that prints hit or miss locations on the board












