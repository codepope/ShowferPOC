import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Show.entity(), sortDescriptors: [])
    
    var shows: FetchedResults<Show>
    
    @State var showShowSheet = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(shows) { show in
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(show.name) S\(show.season)E\(show.episode)").font(.headline)
                            Text("\(show.platform)").font(.subheadline)
                        }
                        Spacer()
                        Button(action: {print("Watched")}) {
                            Text("Watch") }
                        
                    }.frame(height:50)
                }
            }.listStyle(PlainListStyle())
            .navigationTitle("My Shows")
            .sheet(isPresented: $showShowSheet) {
                ShowSheet()
            }
            .navigationBarItems(trailing: Button(action: {
                showShowSheet=true
            }, label: {
                Image(systemName: "plus.circle")
                    .imageScale(.large)
            }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
