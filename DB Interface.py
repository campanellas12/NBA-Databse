import tkinter as tk
from tkinter import ttk
from tkinter import simpledialog
import mysql.connector as mysql

LARGEFONT =("Arial", 45)

db = mysql.connect(
    host = "localhost",
    user = "root",
    passwd = "Kobebryant24",
    database = "NBA"
)

mycursor = db.cursor()


#############
# Functions #
#############

def add(indicator):
    if indicator == 1: # If from Player
        answer = simpledialog.askstring("Input", "Insert:\n\nPlayer Name\nAge\nWeight\nHeight\nTotal Points\nTotal Assists\nTotal Rebounds\nTotal Steals\nTotal Blocks\nTotal Turnovers\nTeam\n\nCOMMA SEPARATED")
        
        answer_to_tuple = tuple(answer.split(", "))
        sql = "INSERT INTO Players (player_name, player_age, player_weight, player_height, player_points, player_assists, player_rebounds, player_steals, player_blocks, player_turnovers, player_team) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"

        mycursor.execute(sql, answer_to_tuple)
        db.commit()

    elif indicator == 2: # If from Team
        answer = simpledialog.askstring("Input", "Insert:\n\nTeam Name\nWins\nLoses\nLocation\nYear Founded\nTotal Championships\nTeam Conference\nTeam Division\n\nCOMMA SEPARATED")

        answer_to_tuple = tuple(answer.split(", "))
        sql = "INSERT INTO Teams (team_name, team_wins, team_losses, team_location, year_founded, team_championships, team_conference, team_division) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"

        mycursor.execute(sql, answer_to_tuple)
        db.commit()
    elif indicator == 3: # If from Division
        answer = simpledialog.askstring("Input", "Insert:\n\nDivision Name\nDivison Wins\nDivision Losses\nDivision Conference\n\nCOMMA SEPARATED")
        
        answer_to_tuple = tuple(answer.split(", "))
        sql = "INSERT INTO Divisions (division_name, division_wins, division_losses, division_conference) VALUES (%s, %s, %s, %s)"

        mycursor.execute(sql, answer_to_tuple)
        db.commit()
    elif indicator == 4: # If from Conference
        answer = simpledialog.askstring("Input", "Insert:\n\nConference Name\nConference Wins\nConference Losses\n\nCOMMA SEPARATED")
        
        answer_to_tuple = tuple(answer.split(", "))
        sql = "INSERT INTO Conferences (conference_name, conference_wins, conference_losses) VALUES (%s, %s, %s)"

        mycursor.execute(sql, answer_to_tuple)
        db.commit()
    else: # If from Draft
        answer = simpledialog.askstring("Input", "Insert:\n\nDraft Pick Overall\nDraft Pick Round Relative\nDraft Pick Round\nDraft Year\nPlayer Team\nPlayer Name\nPlayer Age\nPlayer Weight\nPlayer Height\n\nCOMMA SEPARATED")
        
        answer_to_tuple = tuple(answer.split(", "))
        sql = "INSERT INTO Draft_2020 (draft_pick_overall, draft_pick_round_relative, draft_pick_round, draft_year, player_team, player_name, player_age, player_weight, player_height) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)"

        mycursor.execute("SET foreign_key_checks = 0")
        mycursor.execute(sql, answer_to_tuple)
        db.commit()

def remove(indicator):
    if indicator == 1: # If from Player
        answer = simpledialog.askstring("Input", "Insert:\n\nPlayer Name\n\nCOMMA SEPARATED")

        query = ("DELETE FROM Players WHERE player_name = '"+answer+"'")

        mycursor.execute("SET foreign_key_checks = 0")
        mycursor.execute(query)
        db.commit()
        
    elif indicator == 2: # If from Team
        answer = simpledialog.askstring("Input", "Insert:\n\nTeam Name\n\nCOMMA SEPARATED")
        
        query = ("DELETE FROM Teams WHERE team_name = '"+answer+"'")

        mycursor.execute("SET foreign_key_checks = 0")
        mycursor.execute(query)
        db.commit()
        
    elif indicator == 3: # If from Division
        answer = simpledialog.askstring("Input", "Insert:\n\nDivision Name\n\nCOMMA SEPARATED")
        
        query = ("DELETE FROM Divisions WHERE division_name = '"+answer+"'")

        mycursor.execute("SET foreign_key_checks = 0")
        mycursor.execute(query)
        db.commit()

    elif indicator == 4: # If from Conference
        answer = simpledialog.askstring("Input", "Insert:\n\nConference Name\n\nCOMMA SEPARATED")

        query = ("DELETE FROM Conferences WHERE conference_name = '"+answer+"'")

        mycursor.execute("SET foreign_key_checks = 0")
        mycursor.execute(query)
        db.commit()
        
    else: # If from Draft
        answer = simpledialog.askstring("Input", "Insert:\n\nDraft Pick Overall\n\nCOMMA SEPARATED")

        query = ("DELETE FROM Draft_2020 WHERE draft_pick_overall = '"+answer+"'")

        mycursor.execute("SET foreign_key_checks = 0")
        mycursor.execute(query)
        db.commit()

def edit(indicator):
    if indicator == 1: # If from Player
        answer = simpledialog.askstring("Input", "Insert:\n\nDesired Attribute to Edit:\n***\nage\nweight\nheight\npoints\nassists\nrebounds\nsteals\nblocks\nturnovers\nteam\n***\n\nNew Value of Attribute\nPlayer Name\n\nCOMMA SEPARATED")

        answer_to_list = answer.split(", ")
        query = ("UPDATE Players SET player_" + answer_to_list[0] + " = " + answer_to_list[1] + " WHERE player_name = '" + answer_to_list[2] + "'")

        mycursor.execute("SET foreign_key_checks = 0")
        mycursor.execute(query)
        db.commit()

    elif indicator == 2: # If from Team
        answer = simpledialog.askstring("Input", "Insert:\n\nDesired Attribute to Edit:\n***\nwins\nlosses\nlocation\nfounded\nchampionships\nconference\ndivision\n***\n\nNew Value of Attribute\nTeam Name\n\nCOMMA SEPARATED")

        answer_to_list = answer.split(", ")
        query = ("UPDATE Teams SET team_" + answer_to_list[0] + " = " + answer_to_list[1] + " WHERE team_name = '" + answer_to_list[2] + "'")

        mycursor.execute("SET foreign_key_checks = 0")
        mycursor.execute(query)
        db.commit()
        
    elif indicator == 3: # If from Division
        answer = simpledialog.askstring("Input", "Insert:\n\nDesired Attribute to Edit:\n***\nwins\nlosses\nconference\n***\n\nNew Value of Attribute\nDivision Name\n\nCOMMA SEPARATED")

        answer_to_list = answer.split(", ")
        query = ("UPDATE Divisions SET division_" + answer_to_list[0] + " = " + answer_to_list[1] + " WHERE division_name = '" + answer_to_list[2] + "'")

        mycursor.execute("SET foreign_key_checks = 0")
        mycursor.execute(query)
        db.commit()
        
    elif indicator == 4: # If from Conference
        answer = simpledialog.askstring("Input", "Insert:\n\nDesired Attribute to Edit:\n***\nwins\nlosses\n***\n\nNew Value of Attribute\nConference Name\n\nCOMMA SEPARATED")

        answer_to_list = answer.split(", ")
        query = ("UPDATE Conferences SET conference_" + answer_to_list[0] + " = " + answer_to_list[1] + " WHERE conference_name = '" + answer_to_list[2] + "'")

        mycursor.execute("SET foreign_key_checks = 0")
        mycursor.execute(query)
        db.commit()
        
    else: # If from Draft
        answer = simpledialog.askstring("Input", "Insert:\n\nDesired Attribute to Edit:\n***\ndraft_pick_round_relative\ndraft_pick_round\ndraft_year\nplayer_team\nplayer_name\nplayer_age\nplayer_weight\nplayer_height\n***\n\nNew Value of Attribute\nOverall Draft Pick\n\nCOMMA SEPARATED")

        answer_to_list = answer.split(", ")
        query = ("UPDATE Draft_2020 SET " + answer_to_list[0] + " = " + answer_to_list[1] + " WHERE draft_pick_overall = '" + answer_to_list[2] + "'")

        mycursor.execute("SET foreign_key_checks = 0")
        mycursor.execute(query)
        db.commit()

def search(queryName):
    input = queryName.get()
    search_list = input.split(", ")
    if search_list[0] == "Player":
        cols = ('player_name', 'player_age', 'player_weight', 'player_height', 'player_points', 'player_assists', 'player_rebounds', 'player_steals', 'player_blocks', 'player_turnovers', 'player_team')
        listBox = ttk.Treeview(tk.Tk(), columns=cols, show='headings')

        for col in cols:
            listBox.heading(col, text=col)    
            listBox.grid(row=1, column=0, columnspan=1)

        query = ("SELECT * FROM Players WHERE player_name = '" + search_list[1] + "'")
        mycursor.execute(query)
        records = mycursor.fetchall()

        for i, (player_name, player_age, player_weight, player_height, player_points, player_assists, player_rebounds, player_steals, player_blocks, player_turnovers, player_team) in enumerate(records, start=1):
            listBox.insert("", "end", values=(player_name, player_age, player_weight, player_height, player_points, player_assists, player_rebounds, player_steals, player_blocks, player_turnovers, player_team))


    elif search_list[0] == "Team":
        cols = ('team_name', 'team_wins', 'team_losses', 'team_location', 'year_founded', 'team_championships', 'team_conference', 'team_division')
        listBox = ttk.Treeview(tk.Tk(), columns=cols, show='headings')

        for col in cols:
            listBox.heading(col, text=col)    
            listBox.grid(row=1, column=0, columnspan=1)

        query = ("SELECT * FROM Teams WHERE team_name = '" + search_list[1] + "'")
        mycursor.execute(query)
        records = mycursor.fetchall()

        for i, (team_name, team_wins, team_losses, team_location, year_founded, team_championships, team_conference, team_division) in enumerate(records, start=1):
            listBox.insert("", "end", values=(team_name, team_wins, team_losses, team_location, year_founded, team_championships, team_conference, team_division))
    elif search_list[0] == "Conference":
        cols = ('conference_name', 'conference_wins', 'conference_losses')
        listBox = ttk.Treeview(tk.Tk(), columns=cols, show='headings')

        for col in cols:
            listBox.heading(col, text=col)    
            listBox.grid(row=1, column=0, columnspan=1)

        query = ("SELECT * FROM Conferences WHERE conference_name = '" + search_list[1] + "'")
        mycursor.execute(query)
        records = mycursor.fetchall()

        for i, (conference_name, conference_wins, conference_losses) in enumerate(records, start=1):
            listBox.insert("", "end", values=(conference_name, conference_wins, conference_losses))
    elif search_list[0] == "Division":
        cols = ('division_name', 'division_wins', 'division_losses', 'division_conference')
        listBox = ttk.Treeview(tk.Tk(), columns=cols, show='headings')

        for col in cols:
            listBox.heading(col, text=col)    
            listBox.grid(row=1, column=0, columnspan=1)

        query = ("SELECT * FROM Divisions WHERE division_name = '" + search_list[1] + "'")
        mycursor.execute(query)
        records = mycursor.fetchall()

        for i, (division_name, division_wins, division_losses, division_conference) in enumerate(records, start=1):
            listBox.insert("", "end", values=(division_name, division_wins, division_losses, division_conference))
    else:
        cols = ('draft_pick_overall', 'draft_pick_round_relative', 'draft_pick_round', 'draft_year', 'player_team', 'player_name', 'player_age', 'player_weight', 'player_height')
        listBox = ttk.Treeview(tk.Tk(), columns=cols, show='headings')

        for col in cols:
            listBox.heading(col, text=col)    
            listBox.grid(row=1, column=0, columnspan=1)

        query = ("SELECT * FROM Draft_2020 WHERE draft_pick_overall = '" + search_list[1] + "'")
        mycursor.execute(query)
        records = mycursor.fetchall()

        for i, (draft_pick_overall, draft_pick_round_relative, draft_pick_round, draft_year, player_team, player_name, player_age, player_weight, player_height) in enumerate(records, start=1):
            listBox.insert("", "end", values=(draft_pick_overall, draft_pick_round_relative, draft_pick_round, draft_year, player_team, player_name, player_age, player_weight, player_height))
    



#########
# Pages #
#########
class Application(tk.Tk):
     
    def __init__(self, *args, **kwargs):

        tk.Tk.__init__(self, *args, **kwargs)

        # creating a container
        frame = tk.Frame(self) 
        frame.pack(side = "bottom", fill = "both", expand = True)

        # initializing frames to an empty array
        self.frames = {} 
  
        # iterate through all the pages
        for pages in (Launch, Guest, Admin, Add, Remove, Edit):
  
            page = pages(frame, self)
            page.configure(width=800, height=500)
            self.frames[pages] = page

            page.grid(row = 2, column = 2, sticky ="nsew")

        self.show_frame(Launch)
  
    # to display the current frame passed as
    # parameter
    def show_frame(self, cont):
        frame = self.frames[cont]
        frame.tkraise()
  

# first window frame startpage  
class Launch(tk.Frame):
    def __init__(self, parent, controller):

        tk.Frame.__init__(self, parent)

        # Buttons
        guest_button = tk.Button(self, text = "Guest", bg = 'red', width = 5, height = 2, 
        command = lambda : controller.show_frame(Guest))
        

        admin_button = tk.Button(self, text = "Admin", bg = 'red', width = 5, height = 2,
        command = lambda : controller.show_frame(Admin))

        # Placement
        guest_button.place(relx = 0.55, rely = 0.5)
        admin_button.place(relx = 0.35, rely = 0.5)


# Guest page
class Guest(tk.Frame):
     
    def __init__(self, parent, controller):

        tk.Frame.__init__(self, parent)
        queryName = tk.StringVar()

        # Buttons/Labels
        queryLabel = tk.Label(self, text = "Enter your query here:", )
        instructionsLabel = tk.Label(self, text = "Enter in format: (type, record)\nExample:(Player, LeBron James)\nTypes: Player, Team, Conference, Division, Draft\n")
        queryEntrySpace = tk.Entry(self, textvariable = queryName, width = 35)
        submitbtn = tk.Button(self, text = "Submit", command = lambda: search(queryName))

        back_button = tk.Button(self, text = "Back", bg = 'red', width = 5, height = 2,
        command = lambda : controller.show_frame(Launch))
        
        # Placement
        instructionsLabel.place(x = 225, y = 150)
        queryLabel.place(x = 310, y = 40)
        queryEntrySpace.place(x = 280, y = 75, width = 200)
        submitbtn.place(x = 340, y = 110, width = 75)
        back_button.place(x = 0, y = 0, width = 75)




  
# Admin Page
class Admin(tk.Frame):
    def __init__(self, parent, controller):

        tk.Frame.__init__(self, parent)
        # Buttons
        add_button = tk.Button(self, text = "Add", bg = 'red', width = 5, height = 2,
        command = lambda : controller.show_frame(Add))

        remove_button = tk.Button(self, text = "Remove", bg = 'red', width = 5, height = 2,
        command = lambda : controller.show_frame(Remove))

        edit_button = tk.Button(self, text = "Edit", bg = 'red', width = 5, height = 2,
        command = lambda : controller.show_frame(Edit))

        back_button = tk.Button(self, text = "Back", bg = 'red', width = 5, height = 2,
        command = lambda : controller.show_frame(Launch))
        back_button.place(x = 0, y = 0, width = 75)

        # Placement
        add_button.place(relx = 0.25, rely = 0.5)
        remove_button.place(relx = 0.45, rely = 0.5)
        edit_button.place(relx = 0.65, rely = 0.5)


# Add page
class Add(tk.Frame):
     
    def __init__(self, parent, controller):

        tk.Frame.__init__(self, parent)
        
        # Buttons
        player_button = tk.Button(self, text = "Player", bg = 'red', width = 5, height = 2, 
        command = lambda : add(1))

        team_button = tk.Button(self, text = "Team", bg = 'red', width = 5, height = 2, 
        command = lambda : add(2))

        division_button = tk.Button(self, text = "Division", bg = 'red', width = 5, height = 2, 
        command = lambda : add(3))

        conference_button = tk.Button(self, text = "Conference", bg = 'red', width = 5, height = 2, 
        command = lambda : add(4))
    
        draft_player_button = tk.Button(self, text = "Draft Player", bg = 'red', width = 5, height = 2, 
        command = lambda : add(5))

        back_button = tk.Button(self, text = "Back", bg = 'red', width = 5, height = 2,
        command = lambda : controller.show_frame(Admin))
        back_button.place(x = 0, y = 0, width = 75)
        
        # Placement
        player_button.place(relx = 0.15, rely = 0.5)
        team_button.place(relx = 0.3, rely = 0.5)
        division_button.place(relx = 0.45, rely = 0.5)
        conference_button.place(relx = 0.6, rely = 0.5)
        draft_player_button.place(relx = 0.75, rely = 0.5)


class Remove(tk.Frame):
     
    def __init__(self, parent, controller):

        tk.Frame.__init__(self, parent)
        
        # Buttons
        player_button = tk.Button(self, text = "Player", bg = 'red', width = 5, height = 2, 
        command = lambda : remove(1))

        team_button = tk.Button(self, text = "Team", bg = 'red', width = 5, height = 2, 
        command = lambda : remove(2))

        division_button = tk.Button(self, text = "Division", bg = 'red', width = 5, height = 2, 
        command = lambda : remove(3))

        conference_button = tk.Button(self, text = "Conference", bg = 'red', width = 5, height = 2, 
        command = lambda : remove(4))
    
        draft_player_button = tk.Button(self, text = "Draft Player", bg = 'red', width = 5, height = 2, 
        command = lambda : remove(5))

        back_button = tk.Button(self, text = "Back", bg = 'red', width = 5, height = 2,
        command = lambda : controller.show_frame(Admin))
        back_button.place(x = 0, y = 0, width = 75)

        # Placement
        player_button.place(relx = 0.15, rely = 0.5)
        team_button.place(relx = 0.3, rely = 0.5)
        division_button.place(relx = 0.45, rely = 0.5)
        conference_button.place(relx = 0.6, rely = 0.5)
        draft_player_button.place(relx = 0.75, rely = 0.5)


class Edit(tk.Frame):
     
    def __init__(self, parent, controller):

        tk.Frame.__init__(self, parent)
        
        # Buttons
        player_button = tk.Button(self, text = "Player", bg = 'red', width = 5, height = 2, 
        command = lambda : edit(1))

        team_button = tk.Button(self, text = "Team", bg = 'red', width = 5, height = 2, 
        command = lambda : edit(2))

        division_button = tk.Button(self, text = "Division", bg = 'red', width = 5, height = 2, 
        command = lambda : edit(3))

        conference_button = tk.Button(self, text = "Conference", bg = 'red', width = 5, height = 2, 
        command = lambda : edit(4))
    
        draft_player_button = tk.Button(self, text = "Draft Player", bg = 'red', width = 5, height = 2, 
        command = lambda : edit(5))

        back_button = tk.Button(self, text = "Back", bg = 'red', width = 5, height = 2,
        command = lambda : controller.show_frame(Admin))
        back_button.place(x = 0, y = 0, width = 75)
        
        # Placement
        player_button.place(relx = 0.15, rely = 0.5)
        team_button.place(relx = 0.3, rely = 0.5)
        division_button.place(relx = 0.45, rely = 0.5)
        conference_button.place(relx = 0.6, rely = 0.5)
        draft_player_button.place(relx = 0.75, rely = 0.5)

##########
# Driver #
##########
app = Application()
app.mainloop()



