//
//  TheoryView.swift
//  readsheet
//
//  Created by fonbrot on 07.02.2022.
//

import SwiftUI

struct TheoryView: View {
    
    @State private var currentAmount = 0.0
    @State private var finalAmount = 1.0
    
    var body: some View {
        ZStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaleEffect(finalAmount + currentAmount)
                .gesture(
                    MagnificationGesture()
                        .onChanged { amount in
                            currentAmount = amount - 1
                        }
                        .onEnded { amount in
                            finalAmount += currentAmount
                            currentAmount = 0
                        }
                )
        }
        .navigationBarTitle("", displayMode: .inline)
    }
}

extension TheoryView {
    
    private var imageName: String {
        isIpad ? "theory" : "theoryr"
    }
    
    private var isIpad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
}

struct TheoryView_Previews: PreviewProvider {
    static var previews: some View {
        TheoryView()
            .preferredColorScheme(.dark)
    }
}
