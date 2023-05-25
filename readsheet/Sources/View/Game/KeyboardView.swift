//
//  KeyboardView.swift
//  readsheet
//
//  Created by fonbrot on 01.02.2022.
//

import SwiftUI

struct KeyboardView: View {
    
    @ObservedObject var game: Game
    
    @AppStorage("showNames") var showNames: Bool = DefaultSettings.showNames
    @AppStorage("noteNames") var noteNames: NoteNames = DefaultSettings.noteNames
    
    private let paddings: [CGFloat] = [0.095, 0.238, 0.52, 0.665, 0.805]
    
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .topLeading) {
                HStack(spacing: 0) {
                    ForEach(StaffKey.whiteKeys, id: \.self) { key in
                        Button(action: { game.pressed(key: key)
                        }) {
                            ZStack(alignment: .bottom) {
                                Rectangle()
                                    .fill(colorForKey(color: Colors.keywhite, key: key))
                                    .border(Colors.keyblack, width: 1)
                                if showNames {
                                    Text(key.name(noteNames))
                                        .foregroundColor(.gray)
                                        .padding(.bottom, 20)
                                }
                            }
                        }
                        .buttonStyle(BlackKeyButtonStyle())
                        .disabled(game.pressedNote != nil)
                    }
                }
                ForEach(StaffKey.blackKeys, id: \.self) { key in
                    Button(action: {
                        game.pressed(key: key)
                    }) {
                        Rectangle()
                            .fill(colorForKey(color: Colors.darkgray, key: key))
                            .frame(width: blackWidth(proxy.size.width), height: blackHeight(proxy.size.height))
                            .cornerRadius(radius: 5, corners : [.bottomLeft, .bottomRight])
                    }
                    .padding(.leading, blackPadding(width: proxy.size.width, key: key))
                    .buttonStyle(BlackKeyButtonStyle())
                    .disabled(game.pressedNote != nil)
                }
            }.padding(.horizontal, 1)
        }
    }
}

extension KeyboardView {
    
    private func colorForKey(color: Color, key: StaffKey) -> Color {
        var color: Color = color
        if game.pressedNote != nil {
            if key == game.currentNote.key {
                color = Colors.maingreen
            } else if key == game.pressedNote?.key {
                color = Colors.mainred
            }
        }
        return color
    }
    
    private func blackHeight(_ heigh: CGFloat) -> CGFloat {
        heigh * 0.6
    }
    
    private func blackWidth(_ width: CGFloat) -> CGFloat {
        width * 0.09
    }
    
    private func blackPadding(width: CGFloat, key: StaffKey) -> CGFloat {
        width * paddings[StaffKey.blackKeys.firstIndex(of: key) ?? 0]
    }
}

struct KeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardView(game: Game())
    }
}
