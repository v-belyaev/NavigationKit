import SwiftUI

public struct Router: Equatable {
    // MARK: - Lifecycle
    
    init(_ viewController: UIViewController?) {
        self.present = PresentAction(viewController)
        self.dismiss = DismissAction(viewController)
    }
    
    // MARK: - Public
    
    public let present: PresentAction
    public let dismiss: DismissAction
}

// MARK: - RouterEnvironmentKey

struct RouterEnvironmentKey: EnvironmentKey {
    static var defaultValue: Router = Router(nil)
}

// MARK: - Environment

public extension EnvironmentValues {
    var router: Router {
        get { self[RouterEnvironmentKey.self] }
        set { self[RouterEnvironmentKey.self] = newValue }
    }
}
