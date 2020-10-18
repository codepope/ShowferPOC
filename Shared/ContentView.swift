import SwiftUI
import CoreData

struct ContentView: View {
    @State var showShowSheet = false

    var body: some View {
        NavigationView {
        List {
            Text("Just a Show")
        }
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
