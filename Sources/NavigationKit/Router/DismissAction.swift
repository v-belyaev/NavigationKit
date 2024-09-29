import UIKit

public struct DismissAction: Equatable {
    // MARK: - Lifecycle
    
    init(_ view: UIView?) {
        self.view = view
    }
    
    // MARK: - Public
    
    @MainActor
    public func callAsFunction(
        animated: Bool = true,
        completion: (() -> Void)? = nil
    ) {
        self.view?.viewController?.dismiss(
            animated: animated,
            completion: completion
        )
    }
    
    // MARK: - Private
    
    private weak var view: UIView?
}
