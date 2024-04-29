import SwiftUI

struct RoutersProvider: UIViewRepresentable {
    // MARK: - Lifecycle
    
    init(
        router: Binding<Router?>,
        navigationRouter: Binding<NavigationRouter?>
    ) {
        self._router = router
        self._navigationRouter = navigationRouter
    }
    
    // MARK: - Internal
    
    @Binding var router: Router?
    @Binding var navigationRouter: NavigationRouter?
    
    func makeUIView(
        context: Context
    ) -> UIViewControllerProvider {
        let view = UIViewControllerProvider(frame: .zero)
        view.delegate = context.coordinator
        return view
    }
    
    func updateUIView(
        _ uiView: UIViewControllerProvider,
        context: Context
    ) {}
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(
            router: self.$router,
            navigationRouter: self.$navigationRouter
        )
    }
    
    // MARK: - Coordinator
    
    final class Coordinator: UIViewControllerProviderDelegate {
        init(
            router: Binding<Router?>,
            navigationRouter: Binding<NavigationRouter?>
        ) {
            self._router = router
            self._navigationRouter = navigationRouter
        }
        
        @Binding var router: Router?
        @Binding var navigationRouter: NavigationRouter?
        
        func viewAttachedToWindow(_ view: UIViewControllerProvider) {
            self.router = Router(view.viewController)
            self.navigationRouter = NavigationRouter(view.viewController?.navigationController)
        }
        
        func viewDetachedFromWindow(_ view: UIViewControllerProvider) {
            self.router = nil
            self.navigationRouter = nil
        }
    }
}
