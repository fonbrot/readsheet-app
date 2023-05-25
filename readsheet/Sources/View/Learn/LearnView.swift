//
//  LearnView.swift
//  readsheet
//
//  Created by fonbrot on 07.02.2022.
//

import SwiftUI

struct LearnView: View {
    var body: some View {
        NavigationView {
            List {
                Section {
                    VStack(alignment: .leading) {
                        Text("ReadSheet")
                            .font(.largeTitle)
                            .foregroundColor(Colors.maingreen)
                        Text("Improve your sight-reading skills")
                    }
                }
                Section {
                    NavigationLink(
                        destination: TheoryView()) {
                            Label { Text("Theory")
                            } icon: {
                                Image(systemName: "book")
                                    .foregroundColor(Colors.mainorange)
                            }
                        }
                    NavigationLink(
                        destination: StatisticView()) {
                            Label { Text("Progress")
                            } icon: {
                                Image(systemName: "chart.bar.xaxis")
                                    .foregroundColor(Colors.mainorange)
                            }
                        }
                    NavigationLink(
                        destination: SettingsView()) {
                            Label { Text("Settings")
                            } icon: {
                                Image(systemName: "gear")
                                    .foregroundColor(Colors.mainorange)
                            }
                        }
                }
                Section {
                    NavigationLink(
                        destination: GameView()) {
                            Text("Start")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .padding(.vertical)
                        }
                }
                .listRowBackground(Colors.maingreen)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(
                        destination: InfoView()) {
                            Image(systemName: "info.circle")
                                .foregroundColor(Colors.maingreen)
                        }
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct LearnView_Previews: PreviewProvider {
    static var previews: some View {
        LearnView()
    }
}
