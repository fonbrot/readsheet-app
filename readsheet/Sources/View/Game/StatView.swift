//
//  StatView.swift
//  readsheet
//
//  Created by fonbrot on 06.02.2022.
//

import SwiftUI

struct StatView: View {
    
    @ObservedObject var game: Game
    
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    private var remainTime: String? {
        let minutes = (game.timeRemaining / 60) % 60
        let seconds = game.timeRemaining % 60
        return String(format: "%0.1d:%0.2d", minutes, seconds)
    }
    
    var body: some View {
        HStack(spacing: 0) {
            VStack {
                Text("Time")
                    .foregroundColor(.gray)
                    .font(.caption2)
                Text(remainTime ?? "")
                    .font(.title2)
            }
            .frame(maxWidth: .infinity)
            VStack {
                Text("Right")
                    .foregroundColor(.gray)
                    .font(.caption2)
                Text("\(game.rightAnswers)")
                    .foregroundColor(Colors.maingreen)
                    .font(.title2)
            }
            .frame(maxWidth: .infinity)
            VStack {
                Text("Wrong")
                    .foregroundColor(.gray)
                    .font(.caption2)
                Text("\(game.wrongAnswers)")
                    .foregroundColor(Colors.mainred)
                    .font(.title2)
            }
            .frame(maxWidth: .infinity)
        }
        .onReceive(timer) { time in
            if game.timeRemaining > 0 {
                game.timeRemaining -= 1
            } else {
                timer.upstream.connect().cancel()
                game.active = false
            }
        }
    }
}

struct StatView_Previews: PreviewProvider {
    static var previews: some View {
        StatView(game: Game())
    }
}
