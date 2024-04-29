import UIKit

public struct NavigationPopToRootAction: Equatable {
    // MARK: - Lifecycle
    
    init(_ navigationController: UINavigationController?) {
        self.navigationController = navigationController
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
        
        self.navigationController?.popToRootViewController(
            animated: animated
        )
    }
    
    // MARK: - Private
    
    private weak var navigationController: UINavigationController?
}
