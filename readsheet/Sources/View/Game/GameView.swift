//
//  GameView.swift
//  readsheet
//
//  Created by fonbrot on 01.02.2022.
//

import SwiftUI

struct GameView: View {
    
    @StateObject var game: Game = Game()
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        ZStack {
            VStack {
                StatView(game: game)
                Spacer()
                StaffView(challengeNote: $game.currentNote, pressedNote: $game.pressedNote)
                Spacer()
                KeyboardView(game: game)
            }
            if game.timeRemaining == 0 {
                VStack {
                    Text("Result")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(.bottom)
                    Text(String(localized: "Correct") + " \(game.rightAnswers)")
                        .foregroundColor(.white)
                        .padding(.bottom)
                    Text(String(localized: "Incorrect") + " \(game.wrongAnswers)")
                        .foregroundColor(.white)
                        .padding(.bottom)
                    Button(action: { self.presentation.wrappedValue.dismiss() }) {
                        Text("Close")
                            .foregroundColor(.white)
                            .padding()
                            .cornerRadius(6)
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(.white, lineWidth: 1))
                    }
                }
                .padding(30)
                .background(Colors.maingreen)
            }
        }
        .navigationBarTitle("", displayMode: .inline)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GameView()
        }
    }
}
