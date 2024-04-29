import SwiftUI
import NavigationKit

struct ContentView: View {
    @Environment(\.router.present)
    private var present
    
    @Environment(\.navigationRouter.push)
    private var push
    
    var body: some View {
        VStack {
            Button {
                self.push {
                    FooView()
                } completion: {
                    print("FooView did pushed")
                }
            } label: {
                Text("Push")
            }
            
            Button {
                self.present {
                    FooView()
                } completion: {
                    print("FooView did appeared")
                }
            } label: {
                Text("Present")
            }
        }
    }
}

struct FooView: View {
    @Environment(\.router)
    private var router: Router
    
    @Environment(\.navigationRouter)
    private var navigationRouter: NavigationRouter
    
    var body: some View {
        VStack {
            Text("Foo View")
            
            Button("Dismiss") {
                self.navigationRouter.pop()
                self.router.dismiss()
            }
        }
    }
}

#Preview {
    ContentView()
}
