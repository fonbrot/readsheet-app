//
//  StatisticView.swift
//  readsheet
//
//  Created by fonbrot on 10.02.2022.
//

import SwiftUI

struct StatisticView: View {
    
    @State private var showDate: Date = Date()
    
    @FetchRequest(
        sortDescriptors: [
            NSSortDescriptor(
                keyPath: \DayResult.date,
                ascending: true)
        ])
    private var results: FetchedResults<DayResult>
    
    private let statHeight: CGFloat = 300
    private let rows = [GridItem(.fixed(35))]
    
    var body: some View {
        ScrollViewReader { value in
            VStack {
                HStack {
                    Rectangle()
                        .fill(Colors.mainorange)
                        .frame(width: 30 ,height: 30)
                        .padding(.leading)
                    Text("Total")
                    Spacer()
                    Rectangle()
                        .fill(Colors.maingreen)
                        .frame(width: 30 ,height: 30)
                    Text("Correct")
                    Spacer()
                }
                .padding(.bottom)
                ZStack(alignment: .bottom) {
                    Rectangle()
                        .fill(Colors.lightgray)
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: rows, alignment: .bottom) {
                            ForEach(results) { result in
                                VStack {
                                    ZStack(alignment: .bottom) {
                                        Rectangle()
                                            .fill(Colors.mainorange)
                                            .frame(width: 35, height: totalHeight(result: result))
                                        Rectangle()
                                            .fill(Colors.maingreen)
                                            .frame(height: rightHeight(result: result))
                                        Text("\(result.right)")
                                            .foregroundColor(.white)
                                    }
                                    Text((result.date ?? Date()).formatted(.dateTime.day(.twoDigits).month(.twoDigits)))
                                        .font(.caption2)
                                }
                                .id(result.id)
                            }
                        }
                    }
                }
                .padding()
                .frame(height: statHeight + 100)
                Spacer()
            }
            .onAppear {
                value.scrollTo(results.last?.id)
            }
            .navigationTitle("Progress")
        }
    }
}

extension StatisticView {
    
    private var maxValue: Int16 {
        max(1, results.map({ $0.right + $0.wrong }).max() ?? 0)
    }
    
    private func totalHeight(result: DayResult) -> CGFloat {
        CGFloat(result.right + result.wrong) / CGFloat(maxValue) * statHeight
    }
    
    private func rightHeight(result: DayResult) -> CGFloat {
        CGFloat(result.right) / CGFloat(maxValue) * statHeight
    }
}

struct StatisticView_Previews: PreviewProvider {
    static let manager = PersistenceManager.preview
    static var previews: some View {
        StatisticView()
            .environment(\.managedObjectContext,
                          manager.persistentContainer.viewContext)
    }
}
