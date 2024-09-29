import UIKit

public struct DismissAction: Equatable {
    // MARK: - Lifecycle
    
    init(_ viewController: UIViewController?) {
        self.viewController = viewController
    }
    
    // MARK: - Public
    
    @MainActor
    public func callAsFunction(
        animated: Bool = true,
        completion: (() -> Void)? = nil
    ) {
        self.viewController?.dismiss(
            animated: animated,
            completion: completion
        )
    }
    
    // MARK: - Private
    
    private weak var viewController: UIViewController?
}
