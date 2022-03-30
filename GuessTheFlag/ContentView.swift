//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Jacob Tamayo on 3/30/22.
//

import SwiftUI

struct ContentView: View {
    //Show an alert to keep track of user progess
    @State private var showingScore = false
    
    //Property to store message title in the alert
    @State private var scoreTitle = ""
    
    // Create an array of country names
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    //2. Display 3 flags (1-3) that represet the correct awnser - flags are random
    @State private var correctAnwser = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack(spacing: 20){
                VStack {
                    Text("Choose the correct flag:")
                        .foregroundColor(.white)
                    Text(countries[correctAnwser])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                }
                ForEach(0..<3) { number in
                    Button {
                        flagTapped(number)
                    } label: {
                        Image(countries[number])
                            .renderingMode(.original)
                    }
                }
            }
        }
        .alert(scoreTitle, isPresented: $showingScore){
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is ???")
        }
    }
    
    func flagTapped(_ number: Int){
        if number == correctAnwser {
            scoreTitle = "Correct"
        }else {
            scoreTitle = "Wrong"
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffled()
        correctAnwser = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
