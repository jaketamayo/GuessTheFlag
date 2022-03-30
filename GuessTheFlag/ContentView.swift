//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Jacob Tamayo on 3/30/22.
//

import SwiftUI

struct ContentView: View {
    //1. Create an array of country names
    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    //2. Display 3 flags (1-3) that represet the correct awnser - flags are random
    var correctAnwser = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            Color.purple
                .ignoresSafeArea()
            VStack(spacing: 20){
                VStack {
                    Text("Choose the correct flag:")
                        .foregroundColor(.white)
                    Text(countries[correctAnwser])
                        .foregroundColor(.white)
                        .bold()
                }
                ForEach(0..<3) { number in
                    Button {
                        //flag was tapped
                    } label: {
                        Image(countries[number])
                            .renderingMode(.original)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
