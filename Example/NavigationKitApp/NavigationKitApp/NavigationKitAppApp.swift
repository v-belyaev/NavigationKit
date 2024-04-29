import SwiftUI
import NavigationKit

@main
struct NavigationKitAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
                    .navigation()
            }
        }
    }
}
