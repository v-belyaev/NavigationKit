import SwiftUI

public struct NavigationRouter: Equatable {
    // MARK: - Lifecycle
    
    init(_ view: UIView?) {
        self.pop = NavigationPopAction(view)
        self.push = NavigationPushAction(view)
        self.popToRoot = NavigationPopToRootAction(view)
    }
    
    // MARK: - Public
    
    public let pop: NavigationPopAction
    public let push: NavigationPushAction
    public let popToRoot: NavigationPopToRootAction
}

// MARK: - NavigationRouterEnvironmentKey

struct NavigationRouterEnvironmentKey: EnvironmentKey {
    static var defaultValue: NavigationRouter = NavigationRouter(nil)
}

// MARK: - Environment

public extension EnvironmentValues {
    var navigationRouter: NavigationRouter {
        get { self[NavigationRouterEnvironmentKey.self] }
        set { self[NavigationRouterEnvironmentKey.self] = newValue }
    }
}
