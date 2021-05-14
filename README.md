# cpsc411
Final Project for CPSC 411

Section 1 Functionalities
My program is a randomizer.  There are 3 options: a magic 8 ball, a quarter toss, and a dice roll.  Users can use this application to help make decisions, play games, or for simple entertainment.  The magic 8 ball has a list of responses that could be returned when a user asks a question.  The user can type in their question and see it appear at the top when they click ask.  The button text then changes to ask again and the user can enter a new question.  The center is styled to look like a magic 8 ball where the fortune is displayed.  The quarter toss will return either heads or tails and is styled to look like a quarter.  The last part of the application is the dice roll.  The dice roll is styled to look like a vegas style red die.  When the user clicks roll the number in the red square will display a random number between 1 to 6 as a real dice would.  This allows users who are playing a board game who may have lost their dice to use this application instead.

Section 2 Architecture & Design
I used SwiftUI for my application.  This class was my first exposure to SwiftUI and I was able to use the exercises from class as a template for my project.  I feel like I learned a lot in this class and used the Service.swift file to define my data.  In the data I defined the name of the section (Magic 8, Quarter Toss, and Dice Roll) as well as what the options were that the application would randomly pick.  There is also a view defined in the service.  The ContentView.swift files is the initial screen that is loaded when the user first opens the application.  It contains the list of the three options and clicking on one will load the DetailView.swift file.  Based on the data the name of the option is displayed at the top.  Below that is a custom based on what the user chose and the data determines the view.

Section 3 GitHub Location of Code
https://github.com/sarahsarah7/cpsc411

Section 4 Test Results
I tested the application by entering different text, clicking all the options in various orders and trying the buttons available in each sub app.  Each test was successful in displaying what it should and I have determined that my application is functioning properly.

Section 5 Future Work
I have stayed pretty true to my initial project proposal and have enhanced the application with some fancy UI.  In the future though I would like to add a 4th option to the list that would allow the user to insert their own items to be randomized.  This would not require any code refactoring and would work well with the way the data is currently set up.
