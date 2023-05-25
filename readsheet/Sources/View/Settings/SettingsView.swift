//
//  SettingsView.swift
//  readsheet
//
//  Created by fonbrot on 05.02.2022.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("clef") var clef: Clef = DefaultSettings.clef
    @AppStorage("minTreble") var minTreble: Double = DefaultSettings.minTreble
    @AppStorage("maxTreble") var maxTreble: Double = DefaultSettings.maxTreble
    @AppStorage("minBass") var minBass: Double = DefaultSettings.minBass
    @AppStorage("maxBass") var maxBass: Double = DefaultSettings.maxBass
    @AppStorage("sharp") var sharp: Bool = DefaultSettings.sharp
    @AppStorage("flat") var flat: Bool = DefaultSettings.flat
    @AppStorage("noteNames") var noteNames: NoteNames = DefaultSettings.noteNames
    @AppStorage("showNames") var showNames: Bool = DefaultSettings.showNames
    @AppStorage("duration") var duration: Double = DefaultSettings.duration
    @AppStorage("pause") var pause: Double = DefaultSettings.pause
    @AppStorage("noteSound") var noteSound: Bool = DefaultSettings.noteSound
    @AppStorage("responseSound") var responseSound: Bool = DefaultSettings.responseSound
    @AppStorage("colorMode") var colorMode: ColorMode = DefaultSettings.colorMode
    
    var body: some View {
        List {
            Section(header: Text("Clef")) {
                Picker("Clef", selection: $clef) {
                    ForEach(Clef.allCases) { clef in
                        Text(clef.name)
                    }
                }
                .pickerStyle(.menu)
            }
            Section(header: Text("Staff")) {
                VStack(alignment: .leading) {
                    Text(trebleStaff)
                    HStack {
                        Text("From")
                        Slider(value: $minTreble,
                               in: 0...26,
                               step: 1,
                               onEditingChanged: { _ in
                            maxTreble = max(minTreble + 1, maxTreble)
                        })
                            .accentColor(Colors.maingreen)
                        Text("To")
                        Slider(value: $maxTreble,
                               in: 1...27,
                               step: 1,
                               onEditingChanged: { _ in
                            minTreble = min(maxTreble - 1, minTreble)
                        })
                            .accentColor(Colors.maingreen)
                    }
                }
                VStack(alignment: .leading) {
                    Text(bassStaff)
                    HStack {
                        Text("From")
                        Slider(value: $minBass,
                               in: 0...26,
                               step: 1,
                               onEditingChanged: { _ in
                            maxBass = max(minBass + 1, maxBass)
                        })
                            .accentColor(Colors.maingreen)
                        Text("To")
                        Slider(value: $maxBass,
                               in: 1...27,
                               step: 1,
                               onEditingChanged: { _ in
                            minBass = min(maxBass - 1, minBass)
                        })
                            .accentColor(Colors.maingreen)
                    }
                }
                Toggle("Sharps", isOn: $sharp)
                Toggle("Flats", isOn: $flat)
            }
            Section(header: Text("Note names")) {
                Picker("Note names", selection: $noteNames) {
                    ForEach(NoteNames.allCases) { name in
                        Text(name.name)
                    }
                }
                .pickerStyle(.menu)
                Toggle("Show note names", isOn: $showNames)
            }
            Section() {
                HStack(spacing: 20) {
                    Text(durationText)
                    Slider(value: $duration, in: 1...59, step: 1)
                }
                HStack(spacing: 20) {
                    Text(pauseText)
                    Slider(value: $pause, in: 1...59, step: 1)
                }
                Toggle("Note sound", isOn: $noteSound)
                Toggle("Response sound", isOn: $responseSound)
            }
            Section(header: Text("Appearance")) {
                VStack(alignment: .leading) {
                    Picker("", selection: $colorMode) {
                        ForEach(ColorMode.allCases) { color in
                            Text(color.name)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            }
        }
        .navigationTitle("Settings")
    }
}

extension SettingsView {
    
    private var trebleStaff: String {
        String(localized: "Treble") + " " + minTrebleNote + "-" + maxTrebleNote
    }
    
    private var minTrebleNote: String {
        ClefNote.trebleMainNotes[Int(minTreble)].name(noteNames)
    }
    
    private var maxTrebleNote: String {
        ClefNote.trebleMainNotes[Int(maxTreble)].name(noteNames)
    }
    
    private var bassStaff: String {
        String(localized: "Bass") + " " + minBassNote + "-" + maxBassNote
    }
    
    private var minBassNote: String {
        ClefNote.bassMainNotes[Int(minBass)].name(noteNames)
    }
    
    private var maxBassNote: String {
        ClefNote.bassMainNotes[Int(maxBass)].name(noteNames)
    }
    
    private var durationText: String {
        String(localized: "Duration") + ": " + "\(Int(duration))" + " " + String(localized: "min")
    }
    
    private var pauseText: String {
        String(localized: "Pause") + ": " + "\(Int(pause))" + " " + String(localized: "sec")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environment(\.locale, .init(identifier: "en"))
    }
}
