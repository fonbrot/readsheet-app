//
//  InfoView.swift
//  readsheet
//
//  Created by fonbrot on 10.02.2022.
//

import SwiftUI

struct InfoView: View {
    
    var body: some View {
        List {
            Section() {
                Button(action: { openMail() }) {
                    Label { Text("Send feedback")
                    } icon: {
                        Image(systemName: "envelope")
                            .foregroundColor(Colors.maingreen)
                    }
                }
                Button(action: { openStore() }) {
                    Label { Text("Rate app")
                    } icon: {
                        Image(systemName: "star")
                            .foregroundColor(Colors.maingreen)
                    }
                }
            }
            
            Section() {
                Text(String(localized: "Version") + " " + appVersion)
            }
        }
        .navigationTitle("ReadSheet")
    }
}

extension InfoView {
    
    private var appVersion: String {
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    }
    
    private var mailTo: String {
        "mailto:readsheetapp@gmail.com?subject=Feedback".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
    }
    
    private func openMail() {
       if let url = URL(string: mailTo),
            UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    private func openStore() {
        if let url = URL(string: "https://apps.apple.com/app/1610871157"),
           UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:])
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
