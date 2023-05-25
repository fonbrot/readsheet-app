//
//  NoteView.swift
//  readsheet
//
//  Created by fonbrot on 01.02.2022.
//

import SwiftUI

struct NoteView: View {
    
    let noteWidth: CGFloat = 40
    let noteHeight: CGFloat = 25
    let noteColor: Color
    let sharp: Bool
    let flat: Bool
    
    var body: some View {
        HStack(spacing: 5) {
            if sharp {
                Image("sharp")
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(noteColor)
                    .frame(width: 20)
            }
            if flat {
                Image("flat")
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(noteColor)
                    .frame(width: 20)
            }
            ZStack {
                Ellipse()
                    .fill(noteColor)
                    .frame(width: noteWidth, height: noteHeight)
                Ellipse()
                    .fill(Colors.mainwhite)
                    .frame(width: noteWidth * 0.5, height: noteHeight * 0.9)
                    .rotationEffect(.init(degrees: -30), anchor: .center)
            }
            .padding(.trailing, sharp || flat ? 25 : 0)
            .padding(.vertical, 14)
        }
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView(noteColor: Colors.mainblack, sharp: true, flat: true)
    }
}
