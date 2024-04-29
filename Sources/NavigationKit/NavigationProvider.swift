import SwiftUI

// MARK: - View+

public extension View {
    func navigation() -> some View {
        self.modifier(NavigationProviderModifier())
    }
}

// MARK: - NavigationProviderModifier

struct NavigationProviderModifier: ViewModifier {
    func body(content: Content) -> some View {
        NavigationProvider {
            content
        }
    }
}

// MARK: - NavigationProvider

struct NavigationProvider<Content: View>: View {
    // MARK: - Lifecycle
    
    init(@ViewBuilder _ content: () -> Content) {
        self.content = content()
    }
    
    // MARK: - Internal
    
    var body: some View {
        self.content.background() {
            RoutersProvider(
                router: self.$router,
                navigationRouter: self.$navigationRouter
            )
        }
        .environment(\.router, self.router ?? Router(nil))
        .environment(\.navigationRouter, self.navigationRouter ?? NavigationRouter(nil))
    }
    
    // MARK: - Private
    
    private let content: Content
    
    @State private var router: Router?
    @State private var navigationRouter: NavigationRouter?
}
