import SwiftUI

struct ContentView: View {
    @State
    private var isPresented = false
    
    var body: some View {
        VStack {
            Button("Open") {
                self.isPresented.toggle()
            }
        }
        .sheet(isPresented: self.$isPresented) {
            FooView()
        }
        .navigationTitle("Test")
    }
}

struct FooView: View {
    @Environment(\.dismiss)
    private var dismiss
    
    var body: some View {
        NavigationView {
            Text("Hello, World!")
                .navigationTitle("Test")
            
            VStack {
                Text("Foo View")
                
                Button("Dismiss") {
                    self.dismiss()
                }
            }
        }
        .navigationViewStyle(.columns)
    }
}

#Preview {
    ContentView()
}
