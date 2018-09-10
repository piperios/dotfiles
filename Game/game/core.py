class playerCharacter:

    name = None
    gender = None
    player_class = None

    def __init__(self, name, gender, player_class):
        self.name = name
        self.gender = gender
        self.player_class = player_class

    def Character(self):

        print ("Ah, so %s, you're a %s?" % (name, player_class))
