import UIKit

public struct NavigationPopToRootAction: Equatable {
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
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        
        defer { CATransaction.commit() }
        
        self.view?.viewController?.navigationController?.popToRootViewController(
            animated: animated
        )
    }
    
    // MARK: - Private
    
    private weak var view: UIView?
}
