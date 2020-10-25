//
//  ShowSheet.swift
//  Showfer
//
//  Created by Dj Walker-Morgan on 17/10/2020.
//

import Foundation
import SwiftUI

struct ShowSheet: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment (\.presentationMode) var presentationMode

    @State var platformSelection=Platform.Other
    @State var seriesName=""
    @State var season:Int16=0
    @State var episodeNum:Int16=0
    
    
    var body: some View {
        NavigationView {
            Form {
                Section( header: Text("Show") ) {
                    Group {
                    TextField("Name",text: $seriesName)
                    
                        Picker("Platform",selection:$platformSelection) {
                            ForEach(Platform.allCases, id:\.self) { v in Text(v.name).tag(v) }
                    }
                    Stepper( value: $season, in: 1...20, step:1) {
                        Text("Season \(season)")
                    }
                    }
                }

                Section(header:Text("Watched")) {
                    Stepper("Episode \(episodeNum)",value:$episodeNum, in:1...99)
                }
                Button(action: {
                    guard self.seriesName != "" else { return }
                    let newShow=Show(context: viewContext)
                    newShow.name=self.seriesName
                    newShow.platform=self.platformSelection.name
                    newShow.season=self.season
                    newShow.episode=self.episodeNum
                    newShow.id=UUID()
                    do {
                           try viewContext.save()
                           print("Show saved.")
                            presentationMode.wrappedValue.dismiss()
                       } catch {
                           print(error.localizedDescription)
                       }
                }) {
                    Text("Add Show")
                }
            }.navigationTitle("Add A Show")
        }
    }
}

struct ShowSheet_Previews: PreviewProvider {
    static var previews: some View {
        ShowSheet().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

