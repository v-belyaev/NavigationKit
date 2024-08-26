import SwiftUI
import NavigationKit

@main
struct NavigationKitAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .navigationViewStyle(.stack)
        }
    }
}
