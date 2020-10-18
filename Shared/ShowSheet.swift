//
//  ShowSheet.swift
//  Showfer
//
//  Created by Dj Walker-Morgan on 17/10/2020.
//

import Foundation
import SwiftUI

struct ShowSheet: View {
    @State var platformIndex=Platform.Other
    @State var seriesName=""
    @State var season:Int=0
    @State var episodeNum=0
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header:Text("Show")) {
Picker(selection:$platformIndex,Text("Platform"))
                   {
                                            ForEach(0..<Platform.allCases.count) {
                                                Text(String(describing: Platform.allCases[$0])).tag($0)
                                            }
                                       }
                    TextField("Name",text: $seriesName)
                    Stepper("Season \(season)", value: $season, in: 1...20)
                }
                Section(header:Text("Watched")) {
                    Stepper("Episode \(episodeNum)",value:$episodeNum, in:1...99)
                }
                Button(action: {
                    print("Save the show!")
                }) {
                    Text("Add Show")
                }
            }.navigationTitle("Add A Show")
        }
    }
}

